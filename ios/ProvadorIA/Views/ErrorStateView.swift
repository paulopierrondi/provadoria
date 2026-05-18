import SwiftUI

struct ErrorStateView: View {
    let message: String
    let retry: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48, weight: .light))
                .foregroundStyle(Color.neonPink.opacity(0.7))

            Text("Algo deu errado")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.neuralWhite)

            Text(message)
                .font(.system(size: 16))
                .foregroundColor(.neuralWhite.opacity(0.6))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Button {
                HapticFeedback.medium()
                retry()
            } label: {
                Label("Tentar novamente", systemImage: "arrow.clockwise")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.neuralWhite)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color.neonPink.opacity(0.15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.neonPink.opacity(0.3), lineWidth: 1)
                    )
                    .cornerRadius(12)
            }
            .padding(.top, 8)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.neuralVoid.ignoresSafeArea())
    }
}

#Preview {
    ErrorStateView(message: "Não foi possível carregar os dados.") {}
}
