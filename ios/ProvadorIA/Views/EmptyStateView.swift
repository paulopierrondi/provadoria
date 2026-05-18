import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: icon)
                .font(.system(size: 56, weight: .light))
                .foregroundStyle(Color.electricCyan.opacity(0.5))

            Text(title)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.neuralWhite)
                .multilineTextAlignment(.center)

            Text(message)
                .font(.system(size: 16))
                .foregroundColor(.neuralWhite.opacity(0.6))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            if let actionTitle = actionTitle, let action = action {
                Button {
                    HapticFeedback.medium()
                    action()
                } label: {
                    Text(actionTitle)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(.neuralWhite)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.electricCyan.opacity(0.15))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.electricCyan.opacity(0.3), lineWidth: 1)
                        )
                        .cornerRadius(12)
                }
                .padding(.top, 8)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.neuralVoid.ignoresSafeArea())
    }
}

#Preview {
    EmptyStateView(
        icon: "tshirt",
        title: "Nenhum look ainda",
        message: "Experimente sua primeira roupa e ela aparecerá aqui.",
        actionTitle: "Experimentar Agora",
        action: {}
    )
}
