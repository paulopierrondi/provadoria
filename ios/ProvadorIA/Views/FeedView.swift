import SwiftUI

struct FeedView: View {
    @State private var tryOns: [TryOn] = []
    @State private var isLoading = true
    @State private var selectedFilter = FilterOption.all
    
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
                    loadingSection
                } else {
                    feedSection
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .navigationTitle("Feed")
        .navigationBarTitleDisplayMode(.large)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.appBackground, for: .navigationBar)
        .task {
            await loadFeed()
        }
    }
    
    private var filterSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(FilterOption.allCases, id: \.self) { filter in
                    Button(action: { selectedFilter = filter }) {
                        Text(filter.rawValue)
                            .font(.subheadline.weight(.medium))
                            .foregroundColor(selectedFilter == filter ? .white : .gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                selectedFilter == filter
                                ? AnyView(
                                    Capsule()
                                        .fill(
                                            LinearGradient(
                                                colors: [.appAccentCyan, .appAccentPurple],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                )
                                : AnyView(
                                    Capsule()
                                        .fill(Color.appSurfaceLight)
                                )
                            )
                    }
                }
            }
        }
    }
    
    private var loadingSection: some View {
        VStack(spacing: 16) {
            ProgressView()
                .tint(.appAccentCyan)
                .scaleEffect(1.2)
            
            Text("Carregando feed...")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, minHeight: 300)
    }
    
    private var feedSection: some View {
        LazyVStack(spacing: 20) {
            ForEach(filteredTryOns) { tryOn in
                TryOnCardView(tryOn: tryOn)
            }
        }
    }
    
    private func loadFeed() async {
        do {
            let feed = try await APIService.shared.fetchFeed()
            await MainActor.run {
                tryOns = feed
                isLoading = false
            }
        } catch {
            await MainActor.run {
                isLoading = false
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
