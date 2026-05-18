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

// MARK: - Legacy compatibility

struct AccentGradient: View {
    var body: some View {
        LinearGradient.cyanGradient
    }
}
