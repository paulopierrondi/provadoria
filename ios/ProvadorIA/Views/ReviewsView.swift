import SwiftUI

struct ReviewsView: View {
    let tryOnId: String
    @State private var reviews: [Review] = []
    @State private var isLoading = true
    @State private var hasError = false
    @State private var averageRating: Double = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ratingHeader
                reviewsList
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.neuralVoid.ignoresSafeArea())
        .navigationTitle("Reviews")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.neuralVoid, for: .navigationBar)
        .task {
            await loadReviews()
        }
    }
    
    private var ratingHeader: some View {
        VStack(spacing: 12) {
            Text(String(format: "%.1f", averageRating))
                .font(.system(size: 56, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient.cyanGradient)
            
            HStack(spacing: 4) {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= Int(averageRating.rounded()) ? "star.fill" : "star")
                        .foregroundColor(.appWarning)
                        .font(.title3)
                }
            }
            
            Text("\(reviews.count) reviews")
                .neuralBody()
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .neuralCard()
    }
    
    private var reviewsList: some View {
        VStack(spacing: 12) {
            if isLoading {
                ShimmerLoadingView()
            } else if hasError {
                ErrorStateView(message: "Não foi possível carregar os reviews.") {
                    Task { await loadReviews() }
                }
            } else if reviews.isEmpty {
                EmptyStateView(
                    icon: "star.bubble",
                    title: "Sem reviews",
                    message: "Ninguém avaliou ainda. Seja o primeiro!"
                )
            } else {
                ForEach(reviews) { review in
                    ReviewCard(review: review)
                }
            }
        }
    }
    
    @MainActor
    private func loadReviews() async {
        isLoading = true
        hasError = false
        
        do {
            reviews = try await APIService.shared.fetchReviews(tryOnId: tryOnId)
            if !reviews.isEmpty {
                let total = reviews.reduce(0) { $0 + $1.rating }
                averageRating = Double(total) / Double(reviews.count)
            }
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
        }
    }
}

struct ReviewCard: View {
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                HStack(spacing: 4) {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= review.rating ? "star.fill" : "star")
                            .foregroundColor(.appWarning)
                            .font(.caption)
                    }
                }
                
                Spacer()
                
                Text(review.reviewerName)
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.neuralWhite)
            }
            
            Text(review.comment)
                .neuralBody()
                .foregroundColor(.gray)
                .lineLimit(4)
            
            Text(review.createdAt, style: .relative)
                .neuralCaption()
                .foregroundColor(.gray.opacity(0.6))
        }
        .padding(16)
        .neuralCard()
    }
}

#Preview {
    NavigationStack {
        ReviewsView(tryOnId: "1")
    }
}
