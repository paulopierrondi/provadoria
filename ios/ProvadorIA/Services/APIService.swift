import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case http(Int, String)
    case decoding(Error)
    case network(Error)
    case noToken
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL inválida"
        case .http(let code, _):
            if code == 429 { return "Muitas requisições. Aguarde." }
            if code >= 500 { return "Serviço instável. Tente em segundos." }
            if code == 401 || code == 403 { return "Sessão expirada. Reinicie o app." }
            return "Erro \(code)"
        case .decoding:
            return "Resposta inesperada do servidor"
        case .network:
            return "Sem conexão. Verifique sua rede."
        case .noToken:
            return "Sessão não iniciada"
        }
    }
}

actor APIService {
    static let shared = APIService()
    
    private let baseURL: URL
    private var token: String?
    private let session: URLSession
    
    private init() {
        let raw = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String
            ?? "http://127.0.0.1:8000"
        self.baseURL = URL(string: raw)!
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.waitsForConnectivity = true
        self.session = URLSession(configuration: config)
    }
    
    // MARK: - Auth
    
    func ensureAuthenticated() async throws {
        if token != nil { return }
        try await authenticate()
    }
    
    func authenticate() async throws {
        let (data, response) = try await request(path: "/api/v1/auth/anonymous", method: "POST", authenticated: false)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw APIError.http((response as? HTTPURLResponse)?.statusCode ?? 0, "")
        }
        let result = try JSONDecoder().decode(AuthResponse.self, from: data)
        self.token = result.token
    }
    
    func clearAuth() {
        token = nil
    }
    
    // MARK: - Try-On
    
    func generateTryOn(userPhoto: Data?, clothingPhoto: Data?, description: String) async throws -> TryOn {
        try await ensureAuthenticated()
        let body: [String: String] = [
            "clothing_description": description,
            "user_photo_url": "",
            "clothing_photo_url": ""
        ]
        let (data, _) = try await request(path: "/api/v1/tryon/generate", method: "POST", body: body)
        let dto = try JSONDecoder().decode(TryOnResponseDTO.self, from: data)
        return TryOn(
            id: dto.id,
            imageURL: dto.image_url,
            description: dto.description,
            fitAssessment: dto.fit_assessment,
            styleTips: dto.style_tips,
            occasions: dto.occasions,
            rating: dto.rating,
            votes: dto.votes,
            createdAt: ISO8601DateFormatter().date(from: dto.created_at) ?? Date(),
            userName: "Você",
            userAvatar: "person.circle.fill",
            beforeImageURL: "",
            afterImageURL: ""
        )
    }
    
    func fetchFeed() async throws -> [TryOn] {
        try await ensureAuthenticated()
        let (data, _) = try await request(path: "/api/v1/tryon/feed", method: "GET")
        let dtos = try JSONDecoder().decode([TryOnResponseDTO].self, from: data)
        return dtos.map { dto in
            TryOn(
                id: dto.id,
                imageURL: dto.image_url,
                description: dto.description,
                fitAssessment: dto.fit_assessment,
                styleTips: dto.style_tips,
                occasions: dto.occasions,
                rating: dto.rating,
                votes: dto.votes,
                createdAt: ISO8601DateFormatter().date(from: dto.created_at) ?? Date(),
                userName: "Usuário",
                userAvatar: "person.circle.fill",
                beforeImageURL: "",
                afterImageURL: ""
            )
        }
    }
    
    func voteTryOn(id: String) async throws -> Int {
        try await ensureAuthenticated()
        let body = ["tryon_id": id]
        let (data, _) = try await request(path: "/api/v1/tryon/vote", method: "POST", body: body)
        let result = try JSONDecoder().decode(VoteResponse.self, from: data)
        return result.votes
    }
    
    func fetchReviews(tryOnId: String) async throws -> [Review] {
        try await ensureAuthenticated()
        let (data, _) = try await request(path: "/api/v1/reviews/\(tryOnId)", method: "GET")
        let dtos = try JSONDecoder().decode([ReviewResponseDTO].self, from: data)
        return dtos.map { dto in
            Review(
                id: dto.id,
                tryOnId: dto.tryon_id,
                userName: "Usuário",
                userAvatar: "person.circle.fill",
                rating: dto.rating,
                comment: dto.comment,
                createdAt: ISO8601DateFormatter().date(from: dto.created_at) ?? Date()
            )
        }
    }
    
    func createReview(tryOnId: String, rating: Int, comment: String) async throws {
        try await ensureAuthenticated()
        let body: [String: String] = [
            "tryon_id": tryOnId,
            "rating": String(rating),
            "comment": comment
        ]
        let (_, _) = try await request(path: "/api/v1/reviews", method: "POST", body: body)
    }
    
    // MARK: - Account Deletion
    
    func deleteAccount() async throws {
        try await ensureAuthenticated()
        let (_, response) = try await request(path: "/api/v1/users/me", method: "DELETE")
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw APIError.http((response as? HTTPURLResponse)?.statusCode ?? 0, "")
        }
        clearAuth()
    }
    
    // MARK: - Private
    
    private func request(path: String, method: String, body: [String: String]? = nil, authenticated: Bool = true) async throws -> (Data, URLResponse) {
        guard let url = URL(string: path, relativeTo: baseURL) else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        if authenticated {
            guard let token = token else { throw APIError.noToken }
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        if let body = body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        }
        
        do {
            let (data, response) = try await session.data(for: request)
            if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
                let bodyStr = String(data: data, encoding: .utf8) ?? ""
                throw APIError.http(http.statusCode, bodyStr)
            }
            return (data, response)
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.network(error)
        }
    }
}

// MARK: - DTOs

struct AuthResponse: Codable {
    let user_id: String
    let token: String
}

struct TryOnResponseDTO: Codable {
    let id: String
    let image_url: String
    let description: String
    let fit_assessment: String
    let style_tips: [String]
    let occasions: [String]
    let rating: Double
    let votes: Int
    let created_at: String
}

struct VoteResponse: Codable {
    let success: Bool
    let votes: Int
}

struct ReviewResponseDTO: Codable {
    let id: String
    let tryon_id: String
    let rating: Int
    let comment: String
    let created_at: String
}
