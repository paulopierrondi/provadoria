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
        .background(Color.appBackground.ignoresSafeArea())
    }
    
    private var profileHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.appAccentCyan, .appAccentPurple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
            
            Text(userName)
                .font(.title2.weight(.bold))
                .foregroundColor(.white)
            
            Text("Membro desde Maio 2026")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.appSurface)
        )
    }
    
    private var statsGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 12) {
            StatCard(value: "\(stats.tryOns)", label: "Try-Ons", icon: "camera.viewfinder")
            StatCard(value: "\(stats.votes)", label: "Votos", icon: "heart.fill")
            StatCard(value: "\(stats.reviews)", label: "Reviews", icon: "star.fill")
        }
    }
    
    private var settingsSection: some View {
        VStack(spacing: 12) {
            SettingRow(icon: "crown.fill", title: "Premium", subtitle: "Desbloquear try-ons ilimitados", color: .appWarning)
            SettingRow(icon: "bell.fill", title: "Notificações", subtitle: "Lembretes de desafios", color: .appAccentCyan)
            SettingRow(icon: "share.fill", title: "Compartilhar", subtitle: "Convide amigos", color: .appAccentPurple)
            SettingRow(icon: "questionmark.circle.fill", title: "Ajuda", subtitle: "FAQ e suporte", color: .gray)
            DeleteAccountRow()
        }
    }
}

struct UserStats {
    let tryOns: Int
    let reviews: Int
    let votes: Int
}

struct StatCard: View {
    let value: String
    let label: String
    let icon: String
    var color: Color = .appAccentCyan
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(value)
                .font(.title3.weight(.bold))
                .foregroundColor(.white)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.appSurface)
        )
    }
}

struct SettingRow: View {
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
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.appSurface)
        )
    }
}

struct DeleteAccountRow: View {
    @State private var showConfirmation = false
    @State private var isDeleting = false
    @State private var errorMessage: String?
    @State private var showError = false

    var body: some View {
        Button(action: { showConfirmation = true }) {
            HStack(spacing: 16) {
                Image(systemName: "trash.fill")
                    .font(.title3)
                    .foregroundColor(.red)
                    .frame(width: 40, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.15))
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Text("Excluir Conta")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.red)
                    Text("Remover todos os dados")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Spacer()

                if isDeleting {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .red))
                } else {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.appSurface)
            )
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
    ProfileView()
}
