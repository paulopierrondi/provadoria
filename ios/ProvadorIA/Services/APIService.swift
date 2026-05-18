import Foundation

actor APIService {
    static let shared = APIService()
    
    private init() {}
    
    func generateTryOn(userPhoto: Data?, clothingPhoto: Data?, description: String) async throws -> TryOn {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 2_500_000_000)
        
        // Simulate occasional errors (10% chance)
        if Int.random(in: 0..<10) == 0 {
            throw APIError.generationFailed
        }
        
        return TryOn(
            id: UUID().uuidString,
            imageURL: "",
            description: description.isEmpty ? "Roupa provada virtualmente" : description,
            fitAssessment: "O ajuste ficou excelente! As proporções combinam bem com o seu biotipo e o estilo da peça valoriza a silhueta de forma natural.",
            styleTips: [
                "Adicione acessórios discretos para valorizar o look",
                "Combine com calçados da mesma paleta de cores",
                "Experimente diferentes camadas para ocasiões mais formais"
            ],
            occasions: ["Dia a Dia", "Trabalho", "Encontro", "Evento Casual"],
            rating: Double.random(in: 6.5...9.8),
            votes: Int.random(in: 0...50),
            createdAt: Date(),
            userName: "Você",
            userAvatar: "person.circle.fill",
            beforeImageURL: "",
            afterImageURL: ""
        )
    }
    
    func fetchFeed() async throws -> [TryOn] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return TryOn.samples
    }
    
    func fetchReviews(tryOnId: String) async throws -> [Review] {
        try await Task.sleep(nanoseconds: 800_000_000)
        return Review.samples.filter { $0.tryOnId == tryOnId }
    }
    
    func voteTryOn(id: String) async throws -> Int {
        try await Task.sleep(nanoseconds: 500_000_000)
        return Int.random(in: 100...300)
    }
    
    func analyzeClothing(imageData: Data?) async throws -> ClothingAnalysis {
        try await Task.sleep(nanoseconds: 1_500_000_000)
        return ClothingAnalysis.sample
    }
}

enum APIError: LocalizedError {
    case generationFailed
    case networkError
    case invalidResponse
    
    var errorDescription: String? {
        switch self {
        case .generationFailed:
            return "Falha ao gerar o provador virtual. Tente novamente."
        case .networkError:
            return "Erro de conexão. Verifique sua internet."
        case .invalidResponse:
            return "Resposta inválida do servidor."
        }
    }
}
