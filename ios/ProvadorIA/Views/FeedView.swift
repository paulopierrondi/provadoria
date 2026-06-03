import SwiftUI

struct FeedView: View {
    @State private var tryOns: [TryOn] = []
    @State private var isLoading = true
    @State private var hasError = false
    @State private var errorMessage = ""
    @State private var selectedFilter = FilterOption.all
    @State private var isRefreshing = false
    
    enum FilterOption: String, CaseIterable {
        case all = "Tudo"
        case dresses = "Vestidos"
        case knit = "Tricot"
        case coats = "Casacos"
        case pants = "Calça"
        case winter = "Inverno"
    }
    
    var filteredTryOns: [TryOn] {
        switch selectedFilter {
        case .all:
            return tryOns
        case .dresses:
            return tryOns.filter { $0.description.lowercased().contains("vestido") }
        case .knit:
            return tryOns.filter { $0.description.lowercased().contains("tricot") || $0.description.lowercased().contains("blusa") }
        case .coats:
            return tryOns.filter { $0.description.lowercased().contains("jaqueta") || $0.description.lowercased().contains("casaco") }
        case .pants:
            return tryOns.filter { $0.description.lowercased().contains("calça") || $0.description.lowercased().contains("saia") }
        case .winter:
            return tryOns.filter { $0.description.lowercased().contains("couro") || $0.description.lowercased().contains("blazer") }
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                mastheadSection
                filterSection
                
                if isLoading {
                    ShimmerLoadingView()
                        .padding(.top, 20)
                        .padding(.horizontal, 24)
                } else if hasError {
                    ErrorStateView(message: errorMessage) {
                        Task { await loadFeed() }
                    }
                    .padding(.horizontal, 24)
                } else if filteredTryOns.isEmpty {
                    EmptyStateView(
                        icon: "archivebox",
                        title: "Arquivo vazio",
                        message: "Nenhuma edição encontrada. Seja o primeiro a compartilhar!"
                    )
                    .padding(.horizontal, 24)
                } else {
                    archiveGrid
                }
            }
            .padding(.vertical, 16)
        }
        .background(Color.cherryBone.ignoresSafeArea())
        .refreshable {
            await refreshFeed()
        }
        .task {
            await loadFeed()
        }
    }
    
    private var mastheadSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Coleção")
                    .font(.system(size: 28, weight: .regular, design: .serif))
                    .foregroundColor(.cherryInk)
                Text("\(tryOns.count) edições")
                    .font(.system(size: 12, weight: .regular, design: .monospaced))
                    .tracking(0.5)
                    .foregroundColor(.cherryMid)
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
    
    private var filterSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(FilterOption.allCases, id: \.self) { filter in
                    Button(action: {
                        HapticFeedback.light()
                        selectedFilter = filter
                    }) {
                        Text(filter.rawValue)
                            .font(.system(size: 13, weight: .medium, design: .default))
                            .foregroundColor(selectedFilter == filter ? .cherryBone : .cherryInk)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                selectedFilter == filter
                                ? AnyView(Rectangle().fill(Color.cherryInk))
                                : AnyView(
                                    Rectangle()
                                        .fill(Color.cherryPaper)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.cherryLine, lineWidth: 1)
                                        )
                                )
                            )
                    }
                }
            }
            .padding(.horizontal, 24)
        }
        .padding(.vertical, 8)
    }
    
    private var archiveGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 12),
            GridItem(.flexible(), spacing: 12)
        ], spacing: 12) {
            ForEach(Array(filteredTryOns.enumerated()), id: \.element.id) { index, tryOn in
                ArchiveCard(tryOn: tryOn, index: index)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 8)
    }
    
    @MainActor
    private func loadFeed() async {
        if ProcessInfo.processInfo.arguments.contains("--screenshot-mode") {
            tryOns = TryOn.samples
            isLoading = false
            hasError = false
            return
        }

        isLoading = true
        hasError = false
        
        do {
            let feed = try await APIService.shared.fetchFeed()
            tryOns = feed
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
            errorMessage = "Não foi possível carregar o feed. Verifique sua conexão."
        }
    }
    
    @MainActor
    private func refreshFeed() async {
        isRefreshing = true
        do {
            let feed = try await APIService.shared.fetchFeed()
            tryOns = feed
            hasError = false
        } catch {
            hasError = true
            errorMessage = "Não foi possível carregar o feed. Verifique sua conexão."
        }
        isRefreshing = false
    }
}

struct ArchiveCard: View {
    let tryOn: TryOn
    let index: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .fill(index == 0 ? Color.cherryAccent.opacity(0.15) : Color.cherryPaper)
                    .frame(height: 200)
                    .overlay(
                        Group {
                            if let url = URL(string: tryOn.imageURL), !tryOn.imageURL.isEmpty {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image.resizable().scaledToFill()
                                    case .failure, .empty:
                                        Image(systemName: "tshirt")
                                            .font(.system(size: 40))
                                            .foregroundColor(.cherryMid.opacity(0.4))
                                    @unknown default:
                                        Image(systemName: "tshirt")
                                            .font(.system(size: 40))
                                            .foregroundColor(.cherryMid.opacity(0.4))
                                    }
                                }
                            } else {
                                Image(systemName: "tshirt")
                                    .font(.system(size: 40))
                                    .foregroundColor(.cherryMid.opacity(0.4))
                            }
                        }
                    )
                    .overlay(
                        Rectangle()
                            .stroke(Color.cherryLine, lineWidth: 1)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Nº \(String(format: "%03d", index + 1))")
                        .font(.system(size: 11, weight: .regular, design: .monospaced))
                        .tracking(0.5)
                        .foregroundColor(.cherryMid)
                    
                    Text(tryOn.description)
                        .font(.system(size: 16, weight: .regular, design: .serif))
                        .italic()
                        .foregroundColor(.cherryInk)
                        .lineLimit(2)
                }
                .padding(12)
            }
            
            HStack {
                Text(tryOn.createdAt.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 10, weight: .regular, design: .monospaced))
                    .tracking(0.5)
                    .foregroundColor(.cherryMid)
                
                Spacer()
                
                Text(String(format: "%.1f", tryOn.rating))
                    .font(.system(size: 22, weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(.cherryInk)
            }
            .padding(12)
        }
        .background(Color.cherryBone)
        .overlay(
            Rectangle()
                .stroke(Color.cherryLine, lineWidth: 1)
        )
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
