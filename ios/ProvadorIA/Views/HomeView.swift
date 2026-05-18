import SwiftUI

struct HomeView: View {
    @State private var stats = UserStats(tryOns: 0, reviews: 0, votes: 0)
    @State private var trendingItems: [TryOn] = []
    @State private var isLoading = false
    @State private var loadError = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                headerSection
                quickActionsSection
                statsSection
                trendingSection
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.neuralVoid.ignoresSafeArea())
        .navigationTitle("Início")
        .navigationBarTitleDisplayMode(.large)
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let feed = try await APIService.shared.fetchFeed()
            trendingItems = Array(feed.prefix(5))
            stats = UserStats(
                tryOns: feed.count,
                reviews: 0,
                votes: feed.reduce(0) { $0 + $1.votes }
            )
            loadError = false
        } catch {
            loadError = true
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Bem-vindo ao")
                .neuralBody()
                .foregroundColor(.gray)
            
            HStack(spacing: 4) {
                Text("Provador")
                    .neuralDisplay()
                    .foregroundColor(.neuralWhite)
                
                Text("IA")
                    .neuralDisplay()
                    .foregroundStyle(LinearGradient.cyanGradient)
            }
            
            Text("Experimente roupas virtualmente com IA")
                .neuralBody()
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var quickActionsSection: some View {
        VStack(spacing: 12) {
            NavigationLink(destination: TryOnView()) {
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.electricCyan.opacity(0.12))
                            .frame(width: 56, height: 56)
                        
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 24))
                            .foregroundStyle(LinearGradient.cyanGradient)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Novo Try-On")
                            .neuralTitle()
                            .foregroundColor(.neuralWhite)
                        Text("Tire uma foto e experimente uma roupa")
                            .neuralCaption()
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(16)
                .neuralCard()
            }
            .buttonStyle(.plain)
            
            NavigationLink(destination: FeedView()) {
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.neonPink.opacity(0.12))
                            .frame(width: 56, height: 56)
                        
                        Image(systemName: "photo.stack")
                            .font(.system(size: 24))
                            .foregroundColor(.neonPink)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ver Feed")
                            .neuralTitle()
                            .foregroundColor(.neuralWhite)
                        Text("Descubra looks da comunidade")
                            .neuralCaption()
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(16)
                .neuralCard()
            }
            .buttonStyle(.plain)
        }
    }
    
    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Suas Estatísticas")
                .neuralTitle()
                .foregroundColor(.neuralWhite)
            
            HStack(spacing: 12) {
                StatCard(
                    value: "\(stats.tryOns)",
                    label: "Try-ons",
                    icon: "camera.viewfinder",
                    color: .electricCyan
                )
                
                StatCard(
                    value: "\(stats.reviews)",
                    label: "Reviews",
                    icon: "star.bubble",
                    color: .neonPurple
                )
                
                StatCard(
                    value: "\(stats.votes)",
                    label: "Votos",
                    icon: "arrow.up.heart",
                    color: .neonPink
                )
            }
        }
    }
    
    private var trendingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Tendências")
                    .neuralTitle()
                    .foregroundColor(.neuralWhite)
                
                Spacer()
                
                NavigationLink(destination: FeedView()) {
                    Text("Ver todos")
                        .neuralCaption()
                        .foregroundColor(.electricCyan)
                }
            }
            
            if isLoading {
                ShimmerLoadingView()
            } else if loadError {
                EmptyStateView(
                    icon: "wifi.slash",
                    title: "Sem conexão",
                    message: "Não foi possível carregar as tendências.",
                    actionTitle: "Tentar novamente",
                    action: { Task { await loadData() } }
                )
                .frame(height: 200)
            } else if trendingItems.isEmpty {
                EmptyStateView(
                    icon: "tshirt",
                    title: "Nenhuma tendência ainda",
                    message: "Seja o primeiro a experimentar uma roupa!",
                    actionTitle: "Experimentar",
                    action: {}
                )
                .frame(height: 200)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(trendingItems) { item in
                            TrendingCard(tryOn: item)
                        }
                    }
                }
            }
        }
    }
}

struct TrendingCard: View {
    let tryOn: TryOn
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient.voidGradient)
                .frame(width: 140, height: 140)
                .overlay(
                    Image(systemName: "tshirt")
                        .font(.system(size: 40))
                        .foregroundColor(.gray.opacity(0.5))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.electricCyan.opacity(0.1), lineWidth: 1)
                )
            
            Text(tryOn.description)
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.neuralWhite)
                .lineLimit(2)
            
            Text("\(tryOn.votes) votos")
                .neuralCaption()
                .foregroundColor(.gray)
        }
        .frame(width: 140)
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}

struct StatCard: View {
    let value: String
    let label: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(color)

            Text(value)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(.neuralWhite)

            Text(label)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.neuralWhite.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.neuralDark)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(color.opacity(0.2), lineWidth: 1)
        )
    }
}
