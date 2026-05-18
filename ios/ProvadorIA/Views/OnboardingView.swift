import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var currentPage = 0

    let pages: [OnboardingPage] = [
        OnboardingPage(
            icon: "viewfinder",
            title: "ProvadorIA",
            subtitle: "Experimente roupas com Inteligência Artificial",
            description: "Visualize como qualquer peça ficaria em você antes de comprar. Basta uma foto sua e uma foto da roupa."
        ),
        OnboardingPage(
            icon: "wand.and.stars",
            title: "IA Poderosa",
            subtitle: "Resultados realistas em segundos",
            description: "Nossa IA analisa seu estilo, corpo e preferências para criar visualizações incríveis e personalizadas."
        ),
        OnboardingPage(
            icon: "person.3.fill",
            title: "Comunidade",
            subtitle: "Descubra e compartilhe looks",
            description: "Explore try-ons de outros usuários, vote nos favoritos e compartilhe seus próprios experimentos."
        )
    ]

    var body: some View {
        ZStack {
            Color.neuralVoid.ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        OnboardingPageView(page: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 420)

                Spacer()

                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(currentPage == index ? Color.electricCyan : Color.electricCyan.opacity(0.3))
                            .frame(width: currentPage == index ? 24 : 8, height: 4)
                            .animation(.easeInOut(duration: 0.2), value: currentPage)
                    }
                }
                .padding(.bottom, 32)

                Button {
                    HapticFeedback.medium()
                    if currentPage < pages.count - 1 {
                        withAnimation {
                            currentPage += 1
                        }
                    } else {
                        hasSeenOnboarding = true
                    }
                } label: {
                    Text(currentPage < pages.count - 1 ? "Próximo" : "Começar")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundColor(.neuralWhite)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(LinearGradient.cyanGradient)
                        .cornerRadius(16)
                }
                .pressAnimation()
                .padding(.horizontal, 24)
                .padding(.bottom, 48)
            }
        }
    }
}

struct OnboardingPage {
    let icon: String
    let title: String
    let subtitle: String
    let description: String
}

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(Color.electricCyan.opacity(0.1))
                    .frame(width: 140, height: 140)

                Circle()
                    .stroke(Color.electricCyan.opacity(0.3), lineWidth: 1)
                    .frame(width: 120, height: 120)

                Image(systemName: page.icon)
                    .font(.system(size: 48, weight: .light))
                    .foregroundStyle(Color.electricCyan)
            }

            Text(page.title)
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(.neuralWhite)

            Text(page.subtitle)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.electricCyan)
                .multilineTextAlignment(.center)

            Text(page.description)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.neuralWhite.opacity(0.7))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .lineSpacing(4)
        }
    }
}

#Preview {
    OnboardingView()
}
