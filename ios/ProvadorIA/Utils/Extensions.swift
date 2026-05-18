import SwiftUI
import UIKit

// MARK: - Cherry Editorial Color Palette

extension Color {
    // Foundations
    static let cherryBone = Color(hex: "F8DCD0")
    static let cherryPaper = Color(hex: "FCE7DC")
    static let cherryInk = Color(hex: "1A0E0A")
    static let cherryMid = Color(hex: "8C6A5C")
    static let cherryLine = Color(hex: "1A0E0A").opacity(0.14)
    static let cherryAccent = Color(hex: "E63923")
    static let cherryAccentDeep = Color(hex: "9F1F12")
    
    // Legacy aliases for compatibility
    static let neuralVoid = cherryBone
    static let neuralDark = cherryPaper
    static let neuralSurface = cherryPaper
    static let neuralPanel = cherryPaper
    static let electricCyan = cherryAccent
    static let electricCyanSoft = cherryAccent.opacity(0.6)
    static let neonPurple = cherryAccentDeep
    static let neonPink = cherryAccent
    static let neuralWhite = cherryInk
    static let appBackground = cherryBone
    static let appSurface = cherryPaper
    static let appSurfaceLight = cherryPaper
    static let appAccentCyan = cherryAccent
    static let appAccentPurple = cherryAccentDeep
    static let appAccentPink = cherryAccent
    static let appSuccess = Color(hex: "2D6A4F")
    static let appWarning = Color(hex: "B08900")
    static let appError = Color(hex: "9B2226")
    
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
    static var accentGradient: LinearGradient {
        LinearGradient(colors: [.cherryAccent, .cherryAccentDeep], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    static var paperGradient: LinearGradient {
        LinearGradient(colors: [.cherryPaper, .cherryBone], startPoint: .top, endPoint: .bottom)
    }
    static var inkGradient: LinearGradient {
        LinearGradient(colors: [.cherryInk, Color(hex: "2A1A14")], startPoint: .top, endPoint: .bottom)
    }
}

// MARK: - Typography (Editorial)

extension Font {
    static func display(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .serif)
    }
    static func editorial(size: CGFloat = 17, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .default)
    }
    static func monoLabel(size: CGFloat = 10, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .monospaced)
    }
}

extension View {
    func displayFont(size: CGFloat = 32, weight: Font.Weight = .regular) -> some View {
        self.font(.system(size: size, weight: weight, design: .serif))
    }
    func editorial(size: CGFloat = 16, weight: Font.Weight = .regular) -> some View {
        self.font(.system(size: size, weight: weight, design: .default))
    }
    func monoLabel(size: CGFloat = 10) -> some View {
        self.font(.system(size: size, weight: .regular, design: .monospaced))
            .tracking(1.8)
            .textCase(.uppercase)
    }
    func eyebrow() -> some View {
        self.font(.system(size: 10, weight: .regular, design: .monospaced))
            .tracking(2.4)
            .textCase(.uppercase)
            .foregroundColor(.cherryMid)
    }
}

// MARK: - View Modifiers (Editorial)

struct EditorialCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.cherryPaper)
            .overlay(
                Rectangle()
                    .stroke(Color.cherryLine, lineWidth: 1)
            )
    }
}

struct InkCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.cherryInk)
            .foregroundColor(.cherryBone)
    }
}

extension View {
    func editorialCard() -> some View {
        modifier(EditorialCardModifier())
    }
    func inkCard() -> some View {
        modifier(InkCardModifier())
    }
    func editorialTextField() -> some View {
        self
            .padding(12)
            .background(Color.cherryPaper)
            .overlay(
                Rectangle()
                    .stroke(Color.cherryLine, lineWidth: 1)
            )
    }
}

// MARK: - Button Styles

struct PrimaryEditorialButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold, design: .default))
            .foregroundColor(.cherryBone)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.cherryInk)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct SecondaryEditorialButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold, design: .default))
            .foregroundColor(.cherryInk)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.clear)
            .overlay(
                Rectangle()
                    .stroke(Color.cherryInk, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct AccentEditorialButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.cherryAccent)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

// Legacy compatibility
struct NeuralButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(PrimaryEditorialButtonStyle())
    }
}

struct SecondaryNeuralButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(SecondaryEditorialButtonStyle())
    }
}

// MARK: - Tag Style

struct EditorialTagModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 11, weight: .medium, design: .monospaced))
            .tracking(0.5)
            .foregroundColor(.cherryInk)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.cherryPaper)
            .overlay(
                Rectangle()
                    .stroke(Color.cherryLine, lineWidth: 1)
            )
    }
}

extension View {
    func editorialTag() -> some View {
        modifier(EditorialTagModifier())
    }
    func neuralTag() -> some View {
        editorialTag()
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
                        colors: [Color.clear, Color.cherryAccent.opacity(0.08), Color.clear],
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
    func editorialShimmer() -> some View {
        modifier(ShimmerModifier())
    }
    func neuralShimmer() -> some View {
        editorialShimmer()
    }
    func shimmer() -> some View {
        editorialShimmer()
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
        .clipped()
    }
    
    private var placeholder: some View {
        Rectangle()
            .fill(Color.cherryPaper)
            .overlay(
                Image(systemName: "photo")
                    .font(.system(size: 32))
                    .foregroundColor(.cherryMid.opacity(0.5))
            )
    }
    
    private var errorPlaceholder: some View {
        Rectangle()
            .fill(Color.cherryPaper)
            .overlay(
                VStack(spacing: 8) {
                    Image(systemName: "exclamationmark.circle")
                        .font(.system(size: 28))
                        .foregroundColor(.appError)
                    Text("Erro ao carregar")
                        .monoLabel()
                        .foregroundColor(.cherryMid)
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
                        Rectangle()
                            .fill(index <= currentStep ? Color.cherryAccent.opacity(0.15) : Color.cherryPaper)
                            .frame(width: 28, height: 28)
                        
                        if index < currentStep {
                            Text("✓")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.cherryAccent)
                        } else {
                            Text("\(index + 1)")
                                .font(.system(size: 12, weight: .bold, design: .monospaced))
                                .foregroundColor(index == currentStep ? .cherryAccent : .cherryMid)
                        }
                    }
                    
                    Text(labels[index])
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                        .foregroundColor(index == currentStep ? .cherryAccent : .cherryMid)
                        .lineLimit(1)
                }
                
                if index < totalSteps - 1 {
                    Rectangle()
                        .fill(index < currentStep ? Color.cherryAccent.opacity(0.3) : Color.cherryLine)
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
        LinearGradient.accentGradient
    }
}
