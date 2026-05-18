import SwiftUI

struct ErrorStateView: View {
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "wifi.slash")
                .font(.system(size: 48))
                .foregroundColor(.cherryMid.opacity(0.5))
            
            Text("Algo deu errado")
                .font(.system(size: 20, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)
            
            Text(message)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.cherryMid)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Tentar novamente")
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
        .padding(24)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ErrorStateView(message: "Sem conexão com a internet") {}
        .background(Color.cherryBone)
}
