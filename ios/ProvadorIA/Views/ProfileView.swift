import SwiftUI

struct ProfileView: View {
    @State private var userName = "Você"
    @State private var stats = UserStats(tryOns: 12, reviews: 8, votes: 45)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 28) {
                profileHeader
                statsGrid
                settingsSection
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.neuralVoid.ignoresSafeArea())
        .navigationTitle("Perfil")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private var profileHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(LinearGradient.cyanGradient)
                    .frame(width: 100, height: 100)
                    .cyanGlow()
                
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.neuralWhite)
            }
            
            Text(userName)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.neuralWhite)
            
            Text("Membro desde Maio 2026")
                .neuralBody()
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .neuralCard()
    }
    
    private var statsGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 12) {
            NeuralStatCard(value: "\(stats.tryOns)", label: "Try-Ons", icon: "camera.viewfinder", color: .electricCyan)
            NeuralStatCard(value: "\(stats.votes)", label: "Votos", icon: "heart.fill", color: .neonPink)
            NeuralStatCard(value: "\(stats.reviews)", label: "Reviews", icon: "star.fill", color: .neonPurple)
        }
    }
    
    private var settingsSection: some View {
        VStack(spacing: 12) {
            NeuralSettingRow(icon: "crown.fill", title: "Premium", subtitle: "Desbloquear try-ons ilimitados", color: .appWarning)
            NeuralSettingRow(icon: "bell.fill", title: "Notificações", subtitle: "Lembretes de desafios", color: .electricCyan)
            NeuralSettingRow(icon: "share.fill", title: "Compartilhar", subtitle: "Convide amigos", color: .neonPurple)
            NeuralSettingRow(icon: "questionmark.circle.fill", title: "Ajuda", subtitle: "FAQ e suporte", color: .gray)
            DeleteAccountRow()
        }
    }
}

struct NeuralStatCard: View {
    let value: String
    let label: String
    let icon: String
    var color: Color = .electricCyan
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(value)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.neuralWhite)
            
            Text(label)
                .neuralCaption()
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .neuralCard()
    }
}

struct NeuralSettingRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color.opacity(0.15))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body.weight(.semibold))
                    .foregroundColor(.neuralWhite)
                Text(subtitle)
                    .neuralCaption()
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding(16)
        .neuralCard()
    }
}

struct DeleteAccountRow: View {
    @State private var showConfirmation = false
    @State private var isDeleting = false
    @State private var errorMessage: String?
    @State private var showError = false

    var body: some View {
        Button(action: {
            HapticFeedback.medium()
            showConfirmation = true
        }) {
            HStack(spacing: 16) {
                Image(systemName: "trash.fill")
                    .font(.title3)
                    .foregroundColor(.appError)
                    .frame(width: 40, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.appError.opacity(0.15))
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Text("Excluir Conta")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.appError)
                    Text("Remover todos os dados")
                        .neuralCaption()
                        .foregroundColor(.gray)
                }

                Spacer()

                if isDeleting {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .appError))
                } else {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            .padding(16)
            .neuralCard()
        }
        .disabled(isDeleting)
        .alert("Excluir Conta", isPresented: $showConfirmation) {
            Button("Cancelar", role: .cancel) {}
            Button("Excluir", role: .destructive) {
                performDelete()
            }
        } message: {
            Text("Esta ação é irreversível. Todos os seus dados serão permanentemente removidos.")
        }
        .alert("Erro", isPresented: $showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(errorMessage ?? "Não foi possível excluir a conta.")
        }
    }

    private func performDelete() {
        isDeleting = true
        Task {
            do {
                try await APIService.shared.deleteAccount()
                await MainActor.run {
                    isDeleting = false
                }
            } catch {
                await MainActor.run {
                    isDeleting = false
                    errorMessage = error.localizedDescription
                    showError = true
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
