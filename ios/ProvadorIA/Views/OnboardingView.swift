import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var currentPage = 0
    
    let pages = [
        OnboardingPage(
            eyebrow: "EDIÇÃO 01",
            title: "Veja como fica em *você*.",
            description: "Experimente qualquer roupa virtualmente com IA antes de comprar.",
            accentWord: "você"
        ),
        OnboardingPage(
            eyebrow: "DIREÇÃO DE ARTE",
            title: "A peça, *em foco.*",
            description: "Envie sua foto e a foto da roupa. A IA faz o resto em segundos.",
            accentWord: "em foco"
        ),
        OnboardingPage(
            eyebrow: "COLEÇÃO",
            title: "Cai *perfeito.*",
            description: "Receba análise de caimento, nota e dicas de estilo personalizadas.",
            accentWord: "perfeito"
        )
    ]
    
    var body: some View {
        ZStack {
            Color.cherryBone.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(pages[currentPage].eyebrow)
                        .eyebrow()
                        .foregroundColor(.cherryAccent)
                    
                    let parts = pages[currentPage].title.split(separator: "*", omittingEmptySubsequences: false)
                    if parts.count >= 3 {
                        Text(parts[0])
                            .font(.system(size: 40, weight: .regular, design: .serif))
                            .foregroundColor(.cherryInk)
                        +
                        Text(parts[1])
                            .font(.system(size: 40, weight: .regular, design: .serif))
                            .italic()
                            .foregroundColor(.cherryAccent)
                        +
                        Text(parts[2])
                            .font(.system(size: 40, weight: .regular, design: .serif))
                            .foregroundColor(.cherryInk)
                    } else {
                        Text(pages[currentPage].title)
                            .font(.system(size: 40, weight: .regular, design: .serif))
                            .foregroundColor(.cherryInk)
                    }
                    
                    Text(pages[currentPage].description)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.cherryMid)
                        .lineSpacing(4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                
                Spacer()
                
                VStack(spacing: 24) {
                    HStack(spacing: 8) {
                        ForEach(0..<pages.count, id: \.self) { index in
                            Rectangle()
                                .fill(currentPage == index ? Color.cherryAccent : Color.cherryLine)
                                .frame(width: currentPage == index ? 24 : 8, height: 2)
                                .animation(.easeInOut(duration: 0.3), value: currentPage)
                        }
                    }
                    
                    Button(action: {
                        HapticFeedback.medium()
                        if currentPage < pages.count - 1 {
                            withAnimation {
                                currentPage += 1
                            }
                        } else {
                            hasSeenOnboarding = true
                        }
                    }) {
                        HStack(spacing: 8) {
                            Text(currentPage < pages.count - 1 ? "Continuar →" : "Começar →")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                        }
                        .foregroundColor(.cherryBone)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.cherryInk)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
            }
        }
    }
}

struct OnboardingPage {
    let eyebrow: String
    let title: String
    let description: String
    let accentWord: String
}

#Preview {
    OnboardingView()
}
