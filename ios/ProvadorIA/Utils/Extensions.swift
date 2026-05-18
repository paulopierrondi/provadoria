import SwiftUI

// MARK: - Color Palette — Neural Interface

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

    // Legacy aliases (keep existing views working)
    static let appBackground = neuralVoid
    static let appSurface = neuralDark
    static let appSurfaceLight = neuralSurface
    static let appAccentCyan = electricCyan
    static let appAccentPurple = neonPurple
    static let appAccentPink = neonPink
    static let appSuccess = Color(hex: "10B981")
    static let appWarning = Color(hex: "F59E0B")
    static let appError = Color(hex: "EF4444")

    // Gradients
    static let cyanGradient = LinearGradient(
        colors: [electricCyan, neonPurple],
        startPoint: .leading,
        endPoint: .trailing
    )
    static let voidGradient = LinearGradient(
        colors: [neuralDark, neuralPanel],
        startPoint: .top,
        endPoint: .bottom
    )
    static let glowGradient = LinearGradient(
        colors: [electricCyan.opacity(0.3), neonPurple.opacity(0.3)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

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

// MARK: - Text / View Typography Helpers

extension Text {
    func neuralDisplay(size: CGFloat = 32, weight: Font.Weight = .bold) -> Text {
        self.font(.system(size: size, weight: weight, design: .rounded))
    }

    func neuralTitle(size: CGFloat = 20, weight: Font.Weight = .semibold) -> Text {
        self.font(.system(size: size, weight: weight, design: .rounded))
    }

    func neuralBody(size: CGFloat = 16, weight: Font.Weight = .regular) -> Text {
        self.font(.system(size: size, weight: weight, design: .default))
    }

    func neuralCaption(size: CGFloat = 11, weight: Font.Weight = .medium) -> Text {
        self.font(.system(size: size, weight: weight, design: .monospaced))
    }
}

extension View {
    func neuralDisplay(size: CGFloat = 32, weight: Font.Weight = .bold) -> some View {
        self.font(.system(size: size, weight: weight, design: .rounded))
    }

    func neuralTitle(size: CGFloat = 20, weight: Font.Weight = .semibold) -> some View {
        self.font(.system(size: size, weight: weight, design: .rounded))
    }

    func neuralBody(size: CGFloat = 16, weight: Font.Weight = .regular) -> some View {
        self.font(.system(size: size, weight: weight, design: .default))
    }

    func neuralCaption(size: CGFloat = 11, weight: Font.Weight = .medium) -> some View {
        self.font(.system(size: size, weight: weight, design: .monospaced))
    }
}

extension LinearGradient {
    static var cyanGradient: LinearGradient {
        LinearGradient(colors: [Color.electricCyan, Color.neonPurple], startPoint: .leading, endPoint: .trailing)
    }
    static var voidGradient: LinearGradient {
        LinearGradient(colors: [Color.neuralDark, Color.neuralPanel], startPoint: .top, endPoint: .bottom)
    }
}

extension View {
    func cyanGlow() -> some View {
        self.shadow(color: Color.electricCyan.opacity(0.3), radius: 12, x: 0, y: 0)
    }
}

// MARK: - View Modifiers

struct NeuralCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.neuralDark)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.electricCyan.opacity(0.15), lineWidth: 1)
            )
            .shadow(color: Color.electricCyan.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

struct NeuralButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.neuralWhite)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.cyanGradient)
            .cornerRadius(14)
    }
}

struct NeuralTagModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.neuralCaption())
            .foregroundColor(.electricCyan)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.electricCyan.opacity(0.12))
            .cornerRadius(8)
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

    func neuralButton() -> some View {
        modifier(NeuralButtonModifier())
    }

    func neuralTag() -> some View {
        modifier(NeuralTagModifier())
    }

    func pressAnimation() -> some View {
        modifier(PressAnimationModifier())
    }

    func glassCard() -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.neuralSurface.opacity(0.6))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
    }

    func gradientBorder() -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            colors: [.electricCyan, .neonPurple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
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
                        colors: [
                            .clear,
                            Color.electricCyan.opacity(0.15),
                            .clear
                        ],
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
    func shimmer() -> some View {
        modifier(ShimmerModifier())
    }
}

// MARK: - Haptics

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

// MARK: - Button Styles (Legacy)

struct AccentGradient: View {
    var body: some View {
        LinearGradient(
            colors: [.electricCyan, .neonPurple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

struct AccentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                LinearGradient(
                    colors: [.electricCyan, .neonPurple],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(16)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.neuralSurface)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct NeuralButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.semibold))
            .foregroundColor(.neuralWhite)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.cyanGradient)
            .cornerRadius(14)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct SecondaryNeuralButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.semibold))
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
                            .fill(index <= currentStep ? Color.electricCyan.opacity(0.15) : Color.neuralSurface)
                            .frame(width: 32, height: 32)

                        Circle()
                            .stroke(index <= currentStep ? Color.electricCyan : Color.neuralWhite.opacity(0.2), lineWidth: 1.5)
                            .frame(width: 32, height: 32)

                        Text("\(index + 1)")
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                            .foregroundColor(index <= currentStep ? Color.electricCyan : Color.neuralWhite.opacity(0.4))
                    }

                    Text(labels[index])
                        .font(.system(size: 9, weight: .medium))
                        .foregroundColor(index <= currentStep ? Color.electricCyan : Color.neuralWhite.opacity(0.4))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                }
                .frame(maxWidth: .infinity)

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

struct NeuralTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(Color.neuralSurface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.electricCyan.opacity(0.2), lineWidth: 1)
            )
    }
}

extension View {
    func neuralTextField() -> some View {
        modifier(NeuralTextFieldModifier())
    }
}

