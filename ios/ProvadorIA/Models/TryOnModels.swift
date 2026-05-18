import Foundation

struct TryOn: Identifiable, Codable, Equatable {
    let id: String
    let imageURL: String
    let description: String
    let fitAssessment: String
    let styleTips: [String]
    let occasions: [String]
    let rating: Double
    let votes: Int
    let createdAt: Date
    let userName: String
    let userAvatar: String
    let beforeImageURL: String
    let afterImageURL: String
    
    static func == (lhs: TryOn, rhs: TryOn) -> Bool {
        lhs.id == rhs.id
    }
}

struct ClothingAnalysis: Identifiable, Codable {
    let id: String
    let name: String
    let category: String
    let color: String
    let pattern: String
    let style: String
    let season: String
}

struct Review: Identifiable, Codable {
    let id: String
    let tryOnId: String
    let rating: Int
    let comment: String
    let createdAt: Date
    let reviewerName: String
}

extension TryOn {
    static var sample: TryOn {
        TryOn(
            id: "1",
            imageURL: "",
            description: "Camisa social azul com calça chino bege",
            fitAssessment: "Ajuste slim perfeito para o seu biotipo. As mangas ficam na medida ideal e o comprimento cobre parcialmente a cintura.",
            styleTips: [
                "Combine com um cinto de couro marrom para um visual mais sofisticado",
                "Dobre as mangas até o cotovelo para um look mais casual",
                "Use sapatos oxford ou loafers para completar o visual"
            ],
            occasions: ["Escritório", "Reunião de Negócios", "Jantar Formal", "Casamento Civil"],
            rating: 8.5,
            votes: 124,
            createdAt: Date(),
            userName: "Ana Silva",
            userAvatar: "person.circle.fill",
            beforeImageURL: "",
            afterImageURL: ""
        )
    }
    
    static var samples: [TryOn] {
        [
            sample,
            TryOn(
                id: "2",
                imageURL: "",
                description: "Vestido midi floral para verão",
                fitAssessment: "O corte evasê valoriza a silhueta e a altura do vestido é ideal para eventos diurnos. A estampa floral combina bem com o tom de pele.",
                styleTips: [
                    "Use sandálias de salto bloco para alongar a silhueta",
                    "Adicione uma bolsa de palha para um visual boho-chic",
                    "Brincos de argola dourados complementam o look"
                ],
                occasions: ["Passeio ao Ar Livre", "Brunch", "Festa de Aniversário", "Casamento de Dia"],
                rating: 9.2,
                votes: 89,
                createdAt: Date().addingTimeInterval(-86400),
                userName: "Mariana Costa",
                userAvatar: "person.crop.circle.fill",
                beforeImageURL: "",
                afterImageURL: ""
            ),
            TryOn(
                id: "3",
                imageURL: "",
                description: "Jaqueta de couro preta oversized",
                fitAssessment: "O corte oversized cria um contraste interessante com a sua estrutura corporal. Os ombros caem naturalmente e o comprimento é ideal para sobreposição.",
                styleTips: [
                    "Combine com skinny jeans para equilibrar o volume",
                    "Use botas pesadas para um estilo rocker",
                    "Adicione uma camiseta branca básica por baixo"
                ],
                occasions: ["Show", "Noite com Amigos", "Passeio Urbano", "Festival"],
                rating: 7.8,
                votes: 56,
                createdAt: Date().addingTimeInterval(-172800),
                userName: "Julia Mendes",
                userAvatar: "person.2.circle.fill",
                beforeImageURL: "",
                afterImageURL: ""
            ),
            TryOn(
                id: "4",
                imageURL: "",
                description: "Blazer linho creme com calça wide leg",
                fitAssessment: "O blazer estruturado define bem os ombros e a calça wide leg cria linhas elegantes. A composição em linho é respirável e cai bem no corpo.",
                styleTips: [
                    "Use uma blusa de seda por baixo para textura contrastante",
                    "Escolha mocassins ou sapatilhas bordadas",
                    "Adicione um lenço no pescoço para sofisticação extra"
                ],
                occasions: ["Trabalho Criativo", "Almoço Executivo", "Cocktail", "Viagem de Negócios"],
                rating: 9.0,
                votes: 201,
                createdAt: Date().addingTimeInterval(-259200),
                userName: "Carolina Dias",
                userAvatar: "person.circle",
                beforeImageURL: "",
                afterImageURL: ""
            )
        ]
    }
}

extension Review {
    static var samples: [Review] {
        [
            Review(
                id: "r1",
                tryOnId: "1",
                rating: 5,
                comment: "Ficou incrível! A IA acertou demais no ajuste e as dicas de estilo são super úteis.",
                createdAt: Date().addingTimeInterval(-3600),
                reviewerName: "Beatriz Lima"
            ),
            Review(
                id: "r2",
                tryOnId: "1",
                rating: 4,
                comment: "Muito bom! Só acho que poderia ter mais opções de calçados nas dicas.",
                createdAt: Date().addingTimeInterval(-7200),
                reviewerName: "Fernanda Rocha"
            ),
            Review(
                id: "r3",
                tryOnId: "1",
                rating: 5,
                comment: "Usei as dicas para uma reunião importante e recebi muitos elogios!",
                createdAt: Date().addingTimeInterval(-10800),
                reviewerName: "Patrícia Souza"
            ),
            Review(
                id: "r4",
                tryOnId: "1",
                rating: 4,
                comment: "O resultado ficou bem realista. Gostei especialmente das ocasiões sugeridas.",
                createdAt: Date().addingTimeInterval(-14400),
                reviewerName: "Luciana Oliveira"
            ),
            Review(
                id: "r5",
                tryOnId: "1",
                rating: 5,
                comment: "Melhor app de provador virtual que já usei. Recomendo demais!",
                createdAt: Date().addingTimeInterval(-18000),
                reviewerName: "Camila Torres"
            )
        ]
    }
}

extension ClothingAnalysis {
    static var sample: ClothingAnalysis {
        ClothingAnalysis(
            id: "ca1",
            name: "Camisa Social Premium",
            category: "Camisas",
            color: "Azul Marinho",
            pattern: "Lisa",
            style: "Clássico/Elegante",
            season: "Todas as Estações"
        )
    }
}
