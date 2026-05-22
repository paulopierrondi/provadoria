import SwiftUI

struct HomeView: View {
    @State private var stats = UserStats(tryOns: 0, reviews: 0, votes: 0)
    @State private var recentTryOns: [TryOn] = []
    @State private var isLoading = false
    @State private var loadError = false
    @State private var quotaUsed = 3
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                mastheadSection
                heroSection
                nextTryOnSection
                recentEditionsSection
                footerSection
            }
        }
        .background(Color.cherryBone.ignoresSafeArea())
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let feed = try await APIService.shared.fetchFeed()
            recentTryOns = Array(feed.prefix(5))
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
    
    private var mastheadSection: some View {
        HStack(spacing: 12) {
            Text("Provador")
                .font(.system(size: 18, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)
            +
            Text("ia")
                .font(.system(size: 18, weight: .regular, design: .serif))
                .italic()
                .foregroundColor(.cherryAccent)
            
            Spacer()
            
            HStack(spacing: 8) {
                Rectangle()
                    .fill(Color.cherryInk)
                    .frame(width: 32, height: 32)
                    .overlay(
                        Text("M")
                            .font(.system(size: 14, weight: .medium, design: .serif))
                            .foregroundColor(.cherryBone)
                    )
                
                Text("\(quotaUsed)/5 hoje")
                    .font(.system(size: 11, weight: .medium, design: .monospaced))
                    .tracking(0.5)
                    .foregroundColor(.cherryMid)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.cherryPaper)
                    .overlay(
                        Rectangle()
                            .stroke(Color.cherryLine, lineWidth: 1)
                    )
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
    
    private var heroSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("EDIÇÃO 01 · VIRTUAL TRY-ON")
                .eyebrow()
            
            Text("Como ")
                .font(.system(size: 44, weight: .regular, design: .serif))
                .foregroundColor(.cherryBone)
            +
            Text("fica")
                .font(.system(size: 44, weight: .regular, design: .serif))
                .italic()
                .foregroundColor(.cherryBone)
            +
            Text(" em você?")
                .font(.system(size: 44, weight: .regular, design: .serif))
                .foregroundColor(.cherryBone)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                colors: [.cherryAccent, .cherryAccentDeep],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
    
    private var nextTryOnSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Próximo ensaio")
                        .font(.system(size: 28, weight: .regular, design: .serif))
                        .foregroundColor(.cherryInk)
                    
                    Text("Experimente uma peça nova")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.cherryMid)
                }
                
                Spacer()
                
                NavigationLink(destination: TryOnView()) {
                    ZStack {
                        Rectangle()
                            .fill(Color.cherryInk)
                            .frame(width: 56, height: 56)
                        
                        Image(systemName: "arrow.right")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.cherryBone)
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
        .background(Color.cherryBone)
    }
    
    private var recentEditionsSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Edições recentes")
                .font(.system(size: 20, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)
                .padding(.horizontal, 24)
            
            if isLoading {
                ShimmerLoadingView()
                    .padding(.horizontal, 24)
            } else if loadError {
                EmptyStateView(
                    icon: "wifi.slash",
                    title: "Sem conexão",
                    message: "Não foi possível carregar as edições.",
                    actionTitle: "Tentar novamente",
                    action: { Task { await loadData() } }
                )
                .padding(.horizontal, 24)
            } else if recentTryOns.isEmpty {
                EmptyStateView(
                    icon: "tshirt",
                    title: "Nenhuma edição ainda",
                    message: "Seja o primeiro a experimentar uma roupa!",
                    actionTitle: "Experimentar",
                    action: {}
                )
                .padding(.horizontal, 24)
            } else {
                VStack(spacing: 0) {
                    ForEach(Array(recentTryOns.enumerated()), id: \.element.id) { index, item in
                        HStack(spacing: 16) {
                            Text("Nº \(String(format: "%03d", index + 1))")
                                .font(.system(size: 22, weight: .regular, design: .serif))
                                .italic()
                                .foregroundColor(.cherryAccent)
                                .frame(width: 60, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(item.description)
                                    .font(.system(size: 15, weight: .regular, design: .default))
                                    .foregroundColor(.cherryInk)
                                    .lineLimit(1)
                                
                                Text(item.createdAt.formatted(date: .abbreviated, time: .omitted))
                                    .font(.system(size: 11, weight: .regular, design: .monospaced))
                                    .tracking(0.5)
                                    .foregroundColor(.cherryMid)
                            }
                            
                            Spacer()
                            
                            Text(String(format: "%.1f", item.rating))
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .italic()
                                .foregroundColor(.cherryInk)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 14)
                        .background(index == 0 ? Color.cherryAccent.opacity(0.08) : Color.clear)
                        
                        if index < recentTryOns.count - 1 {
                            Rectangle()
                                .fill(Color.cherryLine)
                                .frame(height: 1)
                                .padding(.horizontal, 24)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
    
    private var footerSection: some View {
        HStack {
            Text("— Veja o arquivo →")
                .font(.system(size: 11, weight: .regular, design: .monospaced))
                .tracking(1.2)
                .foregroundColor(.cherryMid)
            
            Spacer()
            
            Text("P. 02")
                .font(.system(size: 11, weight: .regular, design: .monospaced))
                .tracking(1.2)
                .foregroundColor(.cherryMid)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
    }
}

struct TrendingCard: View {
    let tryOn: TryOn
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Rectangle()
                    .fill(Color.cherryPaper)
                    .frame(width: 140, height: 180)
                
                if let url = URL(string: tryOn.imageURL), !tryOn.imageURL.isEmpty {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable().scaledToFill()
                                .frame(width: 140, height: 180)
                                .clipped()
                        case .failure, .empty:
                            Image(systemName: "tshirt")
                                .font(.system(size: 40))
                                .foregroundColor(.cherryMid.opacity(0.5))
                        @unknown default:
                            Image(systemName: "tshirt")
                                .font(.system(size: 40))
                                .foregroundColor(.cherryMid.opacity(0.5))
                        }
                    }
                } else {
                    Image(systemName: "tshirt")
                        .font(.system(size: 40))
                        .foregroundColor(.cherryMid.opacity(0.5))
                }
            }
            .frame(width: 140, height: 180)
            .overlay(
                Rectangle()
                    .stroke(Color.cherryLine, lineWidth: 1)
            )
            
            Text(tryOn.description)
                .font(.system(size: 14, weight: .semibold, design: .default))
                .foregroundColor(.cherryInk)
                .lineLimit(2)
            
            Text("\(tryOn.votes) votos")
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .tracking(0.5)
                .foregroundColor(.cherryMid)
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
                .foregroundColor(.cherryInk)

            Text(label)
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .tracking(0.5)
                .foregroundColor(.cherryMid)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.cherryPaper)
        .overlay(
            Rectangle()
                .stroke(Color.cherryLine, lineWidth: 1)
        )
    }
}
