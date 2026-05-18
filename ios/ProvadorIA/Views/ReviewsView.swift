import SwiftUI

struct ReviewsView: View {
    let tryOnId: String
    @State private var reviews: [Review] = []
    @State private var isLoading = true
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
        .background(Color.appBackground.ignoresSafeArea())
        .navigationTitle("Reviews")
        .task {
            await loadReviews()
        }
    }
    
    private var ratingHeader: some View {
        VStack(spacing: 12) {
            Text(String(format: "%.1f", averageRating))
                .font(.system(size: 56, weight: .bold))
                .foregroundColor(.white)
            
            HStack(spacing: 4) {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= Int(averageRating.rounded()) ? "star.fill" : "star")
                        .foregroundColor(.appWarning)
                        .font(.title3)
                }
            }
            
            Text("\(reviews.count) reviews")
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
    
    private var reviewsList: some View {
        VStack(spacing: 12) {
            if isLoading {
                ProgressView()
                    .tint(Color.appAccentCyan)
                    .padding()
            } else {
                ForEach(reviews) { review in
                    ReviewCard(review: review)
                }
            }
        }
    }
    
    private func loadReviews() async {
        do {
            reviews = try await APIService.shared.fetchReviews(tryOnId: tryOnId)
            if !reviews.isEmpty {
                let total = reviews.reduce(0) { $0 + $1.rating }
                averageRating = Double(total) / Double(reviews.count)
            }
            isLoading = false
        } catch {
            isLoading = false
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
                    .foregroundColor(.white)
            }
            
            Text(review.comment)
                .font(.body)
                .foregroundColor(.gray)
                .lineLimit(4)
            
            Text(review.createdAt, style: .relative)
                .font(.caption)
                .foregroundColor(.gray.opacity(0.6))
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.appSurface)
        )
    }
}

#Preview {
    ReviewsView(tryOnId: "1")
}
