import SwiftUI
import UIKit

// MARK: - Neural Interface Color Palette

extension Color {
    // Backgrounds — Deep Space
    static let neuralVoid = Color(hex: "050508")
    static let neuralDark = Color(hex: "0A0A12")
    static let neuralSurface = Color(hex: "12121E")
    static let neuralPanel = Color(hex: "0A1628")
    
    // Accents — Electric Cyan & Neon Purple
    static let electricCyan = Color(hex: "00F0FF")
    static let electricCyanSoft = Color(hex: "88F5FF")
    static let neonPurple = Color(hex: "B829F7")
    static let neonPink = Color(hex: "FF2D8F")
    static let neuralWhite = Color(hex: "E8F4F8")
    
    // Legacy aliases
    static let appBackground = neuralVoid
    static let appSurface = neuralDark
    static let appSurfaceLight = neuralSurface
    static let appAccentCyan = electricCyan
    static let appAccentPurple = neonPurple
    static let appAccentPink = neonPink
    static let appSuccess = Color(hex: "10B981")
    static let appWarning = Color(hex: "F59E0B")
    static let appError = Color(hex: "EF4444")
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Gradients

extension LinearGradient {
    static var cyanGradient: LinearGradient {
        LinearGradient(colors: [.electricCyan, .neonPurple], startPoint: .leading, endPoint: .trailing)
    }
    static var voidGradient: LinearGradient {
        LinearGradient(colors: [.neuralDark, .neuralPanel], startPoint: .top, endPoint: .bottom)
    }
    static var glowGradient: LinearGradient {
        LinearGradient(colors: [.electricCyan.opacity(0.3), .neonPurple.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

// MARK: - Typography

extension Font {
    static func neuralDisplay(size: CGFloat = 32, weight: Font.Weight = .bold) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
    static func neuralTitle(size: CGFloat = 20, weight: Font.Weight = .semibold) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
    static func neuralBody(size: CGFloat = 16, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .default)
    }
    static func neuralCaption(size: CGFloat = 11, weight: Font.Weight = .medium) -> Font {
        .system(size: size, weight: weight, design: .monospaced)
    }
}

extension View {
    func neuralDisplay() -> some View {
        self.font(.system(size: 32, weight: .bold, design: .rounded))
    }
    func neuralTitle() -> some View {
        self.font(.system(size: 20, weight: .semibold, design: .rounded))
    }
    func neuralBody() -> some View {
        self.font(.system(size: 16, weight: .regular, design: .default))
    }
    func neuralCaption() -> some View {
        self.font(.system(size: 11, weight: .medium, design: .monospaced))
            .tracking(0.8)
    }
}

// MARK: - View Modifiers

struct NeuralCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.neuralDark)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.electricCyan.opacity(0.15), lineWidth: 1)
            )
            .shadow(color: Color.electricCyan.opacity(0.10), radius: 20, x: 0, y: 4)
    }
}

struct CyanGlowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.electricCyan.opacity(0.25), radius: 12, x: 0, y: 0)
    }
}

struct GlassMorphismModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.electricCyan.opacity(0.05))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.electricCyan.opacity(0.15), lineWidth: 1)
            )
    }
}

struct PressAnimationModifier: ViewModifier {
    @State private var isPressed = false
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: isPressed)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in isPressed = true }
                    .onEnded { _ in isPressed = false }
            )
    }
}

extension View {
    func neuralCard() -> some View {
        modifier(NeuralCardModifier())
    }
    func cyanGlow() -> some View {
        modifier(CyanGlowModifier())
    }
    func glassMorphism() -> some View {
        modifier(GlassMorphismModifier())
    }
    func pressAnimation() -> some View {
        modifier(PressAnimationModifier())
    }
    func neuralTextField() -> some View {
        self
            .padding(12)
            .background(Color.neuralSurface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.electricCyan.opacity(0.2), lineWidth: 1)
            )
    }
    func glassCard() -> some View {
        neuralCard()
    }
    func gradientBorder() -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(LinearGradient.cyanGradient, lineWidth: 1.5)
        )
    }
}

// MARK: - Button Styles

struct NeuralButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundColor(.neuralWhite)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(LinearGradient.cyanGradient)
            .cornerRadius(14)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: Color.electricCyan.opacity(configuration.isPressed ? 0.1 : 0.3), radius: 12, x: 0, y: 4)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct SecondaryNeuralButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundColor(.neuralWhite)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.neuralSurface)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.electricCyan.opacity(0.2), lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct AccentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(NeuralButtonStyle())
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(SecondaryNeuralButtonStyle())
    }
}

struct NeuralTagModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 11, weight: .medium, design: .monospaced))
            .tracking(0.5)
            .foregroundColor(.electricCyan)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.electricCyan.opacity(0.12))
            .cornerRadius(8)
    }
}

extension View {
    func neuralTag() -> some View {
        modifier(NeuralTagModifier())
    }
}

// MARK: - Shimmer Effect

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geo in
                    LinearGradient(
                        colors: [Color.clear, Color.electricCyan.opacity(0.15), Color.clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: geo.size.width * 2)
                    .offset(x: -geo.size.width + phase * geo.size.width * 2)
                }
                .mask(content)
            )
            .onAppear {
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}

extension View {
    func neuralShimmer() -> some View {
        modifier(ShimmerModifier())
    }
    func shimmer() -> some View {
        modifier(ShimmerModifier())
    }
}

// MARK: - Haptic Feedback

enum HapticFeedback {
    static func light() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    static func medium() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    static func heavy() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    static func success() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    static func error() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}

// MARK: - Empty State View

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.neuralSurface)
                    .frame(width: 100, height: 100)
                
                Image(systemName: icon)
                    .font(.system(size: 40))
                    .foregroundStyle(LinearGradient.cyanGradient)
            }
            
            Text(title)
                .neuralTitle()
                .foregroundColor(.neuralWhite)
            
            Text(message)
                .neuralBody()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            if let actionTitle = actionTitle, let action = action {
                Button(action: action) {
                    Text(actionTitle)
                }
                .buttonStyle(NeuralButtonStyle())
                .padding(.horizontal, 40)
                .padding(.top, 8)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 300)
    }
}

// MARK: - Error State View

struct ErrorStateView: View {
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.appError.opacity(0.15))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.appError)
            }
            
            Text("Algo deu errado")
                .neuralTitle()
                .foregroundColor(.neuralWhite)
            
            Text(message)
                .neuralBody()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            Button(action: retryAction) {
                HStack(spacing: 8) {
                    Image(systemName: "arrow.clockwise")
                    Text("Tentar novamente")
                }
            }
            .buttonStyle(NeuralButtonStyle())
            .padding(.horizontal, 40)
            .padding(.top, 8)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 300)
    }
}

// MARK: - Shimmer Loading View

struct ShimmerLoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<3, id: \.self) { _ in
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.neuralSurface)
                    .frame(height: 180)
                    .neuralShimmer()
            }
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Share Sheet

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// MARK: - Async Image View with Placeholder

struct AsyncImageView: View {
    let url: URL?
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                placeholder
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                errorPlaceholder
            @unknown default:
                placeholder
            }
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
    
    private var placeholder: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(LinearGradient.voidGradient)
            .overlay(
                Image(systemName: "photo")
                    .font(.system(size: 32))
                    .foregroundColor(.gray.opacity(0.5))
            )
    }
    
    private var errorPlaceholder: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color.neuralSurface)
            .overlay(
                VStack(spacing: 8) {
                    Image(systemName: "exclamationmark.circle")
                        .font(.system(size: 28))
                        .foregroundColor(.appError)
                    Text("Erro ao carregar")
                        .neuralCaption()
                        .foregroundColor(.gray)
                }
            )
    }
}

// MARK: - Step Indicator

struct StepIndicator: View {
    let currentStep: Int
    let totalSteps: Int
    let labels: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<totalSteps, id: \.self) { index in
                VStack(spacing: 6) {
                    ZStack {
                        Circle()
                            .fill(index <= currentStep ? Color.electricCyan.opacity(0.2) : Color.neuralSurface)
                            .frame(width: 28, height: 28)
                        
                        if index < currentStep {
                            Image(systemName: "checkmark")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.electricCyan)
                        } else {
                            Text("\(index + 1)")
                                .font(.system(size: 12, weight: .bold, design: .monospaced))
                                .foregroundColor(index == currentStep ? .electricCyan : .gray)
                        }
                    }
                    
                    Text(labels[index])
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                        .foregroundColor(index == currentStep ? .electricCyan : .gray)
                        .lineLimit(1)
                }
                
                if index < totalSteps - 1 {
                    Rectangle()
                        .fill(index < currentStep ? Color.electricCyan.opacity(0.4) : Color.neuralWhite.opacity(0.1))
                        .frame(height: 1)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}

// MARK: - Onboarding View

struct OnboardingView: View {
    let onComplete: () -> Void
    @State private var currentPage = 0
    
    private let pages = [
        OnboardingPage(
            icon: "camera.viewfinder",
            title: "Bem-vindo ao ProvadorIA",
            description: "Experimente roupas virtualmente com inteligência artificial. Veja como fica em você antes de comprar."
        ),
        OnboardingPage(
            icon: "sparkles",
            title: "Como Funciona",
            description: "1. Tire uma foto sua\n2. Escolha a roupa\n3. A IA gera o preview em segundos\n4. Receba dicas de estilo personalizadas"
        ),
        OnboardingPage(
            icon: "arrow.up.heart",
            title: "Compartilhe e Vote",
            description: "Participe da comunidade, compartilhe seus looks e descubra o que está em alta no feed."
        )
    ]
    
    var body: some View {
        ZStack {
            Color.neuralVoid.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color.electricCyan.opacity(0.08))
                        .frame(width: 140, height: 140)
                        .cyanGlow()
                    
                    Image(systemName: pages[currentPage].icon)
                        .font(.system(size: 56, weight: .light))
                        .foregroundStyle(LinearGradient.cyanGradient)
                }
                .padding(.bottom, 40)
                
                Text(pages[currentPage].title)
                    .neuralDisplay()
                    .foregroundColor(.neuralWhite)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                
                Text(pages[currentPage].description)
                    .neuralBody()
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.top, 16)
                
                Spacer()
                
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        Capsule()
                            .fill(index == currentPage ? Color.electricCyan : Color.neuralSurface)
                            .frame(width: index == currentPage ? 24 : 8, height: 8)
                            .animation(.easeInOut(duration: 0.2), value: currentPage)
                    }
                }
                .padding(.bottom, 32)
                
                HStack(spacing: 16) {
                    if currentPage > 0 {
                        Button(action: { currentPage -= 1 }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.neuralWhite)
                                .frame(width: 56, height: 56)
                                .background(Color.neuralSurface)
                                .cornerRadius(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.electricCyan.opacity(0.2), lineWidth: 1)
                                )
                        }
                    }
                    
                    Button(action: {
                        HapticFeedback.medium()
                        if currentPage < pages.count - 1 {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                currentPage += 1
                            }
                        } else {
                            onComplete()
                        }
                    }) {
                        HStack(spacing: 8) {
                            Text(currentPage < pages.count - 1 ? "Continuar" : "Começar")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                            Image(systemName: currentPage < pages.count - 1 ? "chevron.right" : "arrow.right")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.neuralWhite)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(LinearGradient.cyanGradient)
                        .cornerRadius(14)
                        .shadow(color: Color.electricCyan.opacity(0.3), radius: 12, x: 0, y: 4)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
            }
        }
    }
}

struct OnboardingPage {
    let icon: String
    let title: String
    let description: String
}

// MARK: - Legacy compatibility

struct AccentGradient: View {
    var body: some View {
        LinearGradient.cyanGradient
    }
}
