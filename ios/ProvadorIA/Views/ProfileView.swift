import SwiftUI

struct ProfileView: View {
    @State private var userName = "Marina"
    @State private var lastName = "Souza"
    @State private var stats = UserStats(tryOns: 12, reviews: 8, votes: 45)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 32) {
                headerSection
                statsSection
                indexSection
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
        }
        .background(Color.cherryBone.ignoresSafeArea())
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Editora · São Paulo")
                .eyebrow()
            
            HStack(spacing: 0) {
                Text(userName)
                    .font(.system(size: 48, weight: .regular, design: .serif))
                    .foregroundColor(.cherryInk)
                Text(" \(lastName)")
                    .font(.system(size: 48, weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(.cherryInk)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var statsSection: some View {
        HStack(spacing: 0) {
            StatItem(value: "\(stats.tryOns)", label: "Edições")
            Rectangle()
                .fill(Color.cherryLine)
                .frame(width: 1, height: 40)
            StatItem(value: "8,7", label: "Caimento médio")
            Rectangle()
                .fill(Color.cherryLine)
                .frame(width: 1, height: 40)
            StatItem(value: "\(stats.tryOns)", label: "Arquivo")
        }
        .padding(.vertical, 16)
        .background(Color.cherryPaper)
        .overlay(
            Rectangle()
                .stroke(Color.cherryLine, lineWidth: 1)
        )
    }
    
    private var indexSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Índice — conta")
                .font(.system(size: 20, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)
            
            VStack(spacing: 0) {
                IndexRow(number: 1, label: "Edições salvas", sublabel: "\(stats.tryOns) looks")
                IndexRow(number: 2, label: "Reviews escritas", sublabel: "\(stats.reviews) análises")
                IndexRow(number: 3, label: "Votos recebidos", sublabel: "\(stats.votes) curtidas")
                IndexRow(number: 4, label: "Notificações", sublabel: "Ativadas")
                IndexRow(number: 5, label: "Privacidade", sublabel: "Pública")
                IndexRow(number: 6, label: "Excluir conta", sublabel: "Remover todos os dados", isDestructive: true)
            }
        }
    }
}

struct StatItem: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 28, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)
            
            Text(label)
                .font(.system(size: 10, weight: .regular, design: .monospaced))
                .tracking(0.5)
                .foregroundColor(.cherryMid)
        }
        .frame(maxWidth: .infinity)
    }
}

struct IndexRow: View {
    let number: Int
    let label: String
    let sublabel: String
    var isDestructive: Bool = false
    
    var body: some View {
        HStack(spacing: 16) {
            Text(String(format: "%02d", number))
                .font(.system(size: 12, weight: .regular, design: .monospaced))
                .tracking(0.5)
                .foregroundColor(.cherryMid)
                .frame(width: 28)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.system(size: 16, weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(isDestructive ? .cherryAccent : .cherryInk)
                Text(sublabel)
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .foregroundColor(.cherryMid)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.cherryMid)
        }
        .padding(.vertical, 14)
        .overlay(
            Rectangle()
                .fill(Color.cherryLine)
                .frame(height: 1),
            alignment: .bottom
        )
    }
}

struct NeuralStatCard: View {
    let value: String
    let label: String
    let icon: String
    var color: Color = .cherryAccent
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(value)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.cherryInk)
            
            Text(label)
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .tracking(0.5)
                .foregroundColor(.cherryMid)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color.cherryPaper)
        .overlay(
            Rectangle()
                .stroke(Color.cherryLine, lineWidth: 1)
        )
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
                    Rectangle()
                        .fill(color.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body.weight(.semibold))
                    .foregroundColor(.cherryInk)
                Text(subtitle)
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .foregroundColor(.cherryMid)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.cherryMid)
                .font(.caption)
        }
        .padding(16)
        .background(Color.cherryPaper)
        .overlay(
            Rectangle()
                .stroke(Color.cherryLine, lineWidth: 1)
        )
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
                    .foregroundColor(.cherryAccent)
                    .frame(width: 40, height: 40)
                    .background(
                        Rectangle()
                            .fill(Color.cherryAccent.opacity(0.1))
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Text("Excluir Conta")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.cherryAccent)
                    Text("Remover todos os dados")
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(.cherryMid)
                }

                Spacer()

                if isDeleting {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .cherryAccent))
                } else {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.cherryMid)
                        .font(.caption)
                }
            }
            .padding(16)
            .background(Color.cherryPaper)
            .overlay(
                Rectangle()
                    .stroke(Color.cherryLine, lineWidth: 1)
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
                await APIService.shared.clearAuth()
                await MainActor.run {
                    isDeleting = false
                    UserDefaults.standard.removeObject(forKey: "hasSeenOnboarding")
                }
            } catch {
                await MainActor.run {
                    isDeleting = false
                    errorMessage = "Não foi possível excluir a conta. Tente novamente mais tarde."
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
