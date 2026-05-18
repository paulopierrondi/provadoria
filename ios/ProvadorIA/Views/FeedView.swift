import SwiftUI

struct FeedView: View {
    @State private var tryOns: [TryOn] = []
    @State private var isLoading = true
    @State private var hasError = false
    @State private var errorMessage = ""
    @State private var selectedFilter = FilterOption.all
    @State private var isRefreshing = false
    
    enum FilterOption: String, CaseIterable {
        case all = "Todos"
        case trending = "Trending"
        case recent = "Recentes"
        case topRated = "Top Rated"
    }
    
    var filteredTryOns: [TryOn] {
        switch selectedFilter {
        case .all:
            return tryOns
        case .trending:
            return tryOns.sorted { $0.votes > $1.votes }
        case .recent:
            return tryOns.sorted { $0.createdAt > $1.createdAt }
        case .topRated:
            return tryOns.sorted { $0.rating > $1.rating }
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                filterSection
                
                if isLoading {
                    ShimmerLoadingView()
                        .padding(.top, 20)
                } else if hasError {
                    ErrorStateView(message: errorMessage) {
                        Task { await loadFeed() }
                    }
                } else if filteredTryOns.isEmpty {
                    EmptyStateView(
                        icon: "photo.stack",
                        title: "Feed vazio",
                        message: "Nenhum look encontrado. Seja o primeiro a compartilhar!"
                    )
                } else {
                    feedSection
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
        .background(Color.neuralVoid.ignoresSafeArea())
        .navigationTitle("Feed")
        .navigationBarTitleDisplayMode(.large)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.neuralVoid, for: .navigationBar)
        .refreshable {
            await refreshFeed()
        }
        .task {
            await loadFeed()
        }
    }
    
    private var filterSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(FilterOption.allCases, id: \.self) { filter in
                    Button(action: {
                        HapticFeedback.light()
                        selectedFilter = filter
                    }) {
                        Text(filter.rawValue)
                            .font(.subheadline.weight(.medium))
                            .foregroundColor(selectedFilter == filter ? .neuralWhite : .gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                selectedFilter == filter
                                ? AnyView(
                                    Capsule()
                                        .fill(LinearGradient.cyanGradient)
                                )
                                : AnyView(
                                    Capsule()
                                        .fill(Color.neuralSurface)
                                )
                            )
                    }
                }
            }
        }
    }
    
    private var feedSection: some View {
        LazyVStack(spacing: 20) {
            ForEach(filteredTryOns) { tryOn in
                TryOnCardView(tryOn: tryOn)
            }
        }
    }
    
    @MainActor
    private func loadFeed() async {
        isLoading = true
        hasError = false
        
        do {
            let feed = try await APIService.shared.fetchFeed()
            tryOns = feed
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
            errorMessage = error.localizedDescription
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
            errorMessage = error.localizedDescription
        }
        isRefreshing = false
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
