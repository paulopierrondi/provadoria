import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 48))
                .foregroundColor(.cherryMid.opacity(0.5))
            
            Text(title)
                .font(.system(size: 20, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)
            
            Text(message)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.cherryMid)
                .multilineTextAlignment(.center)
                .lineSpacing(2)
            
            if let actionTitle = actionTitle, let action = action {
                Button(action: action) {
                    Text(actionTitle)
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundColor(.cherryInk)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .overlay(
                            Rectangle()
                                .stroke(Color.cherryInk, lineWidth: 1)
                        )
                }
                .padding(.top, 8)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    EmptyStateView(
        icon: "archivebox",
        title: "Arquivo vazio",
        message: "Nenhuma edição encontrada ainda.",
        actionTitle: "Experimentar",
        action: {}
    )
    .background(Color.cherryBone)
}
