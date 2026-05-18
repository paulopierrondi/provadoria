import SwiftUI

struct HomeView: View {
    @State private var stats = UserStats(tryOns: 12, reviews: 8, votes: 45)
    @State private var trendingItems = TrendingItem.samples
    
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
        .background(Color.appBackground.ignoresSafeArea())
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Bem-vindo ao")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack(spacing: 4) {
                Text("Provador")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                Text("IA")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.appAccentCyan, .appAccentPurple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            
            Text("Experimente roupas virtualmente com IA")
                .font(.subheadline)
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
                            .fill(
                                LinearGradient(
                                    colors: [.appAccentCyan.opacity(0.2), .appAccentPurple.opacity(0.2)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 56, height: 56)
                        
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 24))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.appAccentCyan, .appAccentPurple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Novo Try-On")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Tire uma foto e experimente uma roupa")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(16)
                .glassCard()
            }
            
            NavigationLink(destination: FeedView()) {
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.appAccentPink.opacity(0.15))
                            .frame(width: 56, height: 56)
                        
                        Image(systemName: "photo.stack")
                            .font(.system(size: 24))
                            .foregroundColor(.appAccentPink)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ver Feed")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Descubra looks da comunidade")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(16)
                .glassCard()
            }
        }
    }
    
    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Suas Estatísticas")
                .font(.headline)
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                StatCard(
                    value: "\(stats.tryOns)",
                    label: "Try-ons",
                    icon: "camera.viewfinder",
                    color: .appAccentCyan
                )
                
                StatCard(
                    value: "\(stats.reviews)",
                    label: "Reviews",
                    icon: "star.bubble",
                    color: .appAccentPurple
                )
                
                StatCard(
                    value: "\(stats.votes)",
                    label: "Votos",
                    icon: "arrow.up.heart",
                    color: .appAccentPink
                )
            }
        }
    }
    
    private var trendingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Tendências")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Ver todos")
                    .font(.caption)
                    .foregroundColor(.appAccentCyan)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(trendingItems) { item in
                        TrendingCard(item: item)
                    }
                }
            }
        }
    }
}

struct TrendingItem: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let color: String
    
    static var samples: [TrendingItem] {
        [
            TrendingItem(name: "Camisa Linho", category: "Camisas", color: "Bege"),
            TrendingItem(name: "Vestido Midi", category: "Vestidos", color: "Preto"),
            TrendingItem(name: "Blazer Oversized", category: "Blazers", color: "Cinza"),
            TrendingItem(name: "Calça Wide Leg", category: "Calças", color: "Creme"),
            TrendingItem(name: "Saia Plissada", category: "Saias", color: "Vinho")
        ]
    }
}

struct TrendingCard: View {
    let item: TrendingItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.appSurfaceLight, Color.appSurface],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 140, height: 140)
                .overlay(
                    Image(systemName: "tshirt")
                        .font(.system(size: 40))
                        .foregroundColor(.gray.opacity(0.5))
                )
            
            Text(item.name)
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.white)
                .lineLimit(1)
            
            Text("\(item.category) · \(item.color)")
                .font(.caption)
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
