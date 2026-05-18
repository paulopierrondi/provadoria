import SwiftUI

struct ReviewsView: View {
    let tryOnId: String
    @State private var reviews: [Review] = []
    @State private var isLoading = true
    @State private var newComment = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                if isLoading {
                    ShimmerLoadingView()
                        .padding(.horizontal, 24)
                } else {
                    VStack(spacing: 0) {
                        ForEach(Array(reviews.enumerated()), id: \.element.id) { index, review in
                            ReviewRow(review: review)
                            
                            if index < reviews.count - 1 {
                                Rectangle()
                                    .fill(Color.cherryLine)
                                    .frame(height: 1)
                                    .padding(.horizontal, 24)
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 16)
        }
        .background(Color.cherryBone.ignoresSafeArea())
        .navigationTitle("Reviews")
        .navigationBarTitleDisplayMode(.large)
        .task {
            await loadReviews()
        }
    }
    
    private func loadReviews() async {
        isLoading = true
        // Simulate loading
        try? await Task.sleep(nanoseconds: 500_000_000)
        reviews = Review.samples
        isLoading = false
    }
}

struct ReviewRow: View {
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Rectangle()
                    .fill(Color.cherryInk)
                    .frame(width: 32, height: 32)
                    .overlay(
                        Text(String(review.reviewerName.prefix(1)))
                            .font(.system(size: 14, weight: .medium, design: .serif))
                            .foregroundColor(.cherryBone)
                    )
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(review.reviewerName)
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundColor(.cherryInk)
                    
                    Text(review.createdAt.formatted(date: .abbreviated, time: .shortened))
                        .font(.system(size: 11, weight: .regular, design: .monospaced))
                        .tracking(0.5)
                        .foregroundColor(.cherryMid)
                }
                
                Spacer()
                
                Text("\(review.rating)/5")
                    .font(.system(size: 14, weight: .medium, design: .monospaced))
                    .tracking(0.5)
                    .foregroundColor(.cherryAccent)
            }
            
            Text(review.comment)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.cherryInk.opacity(0.9))
                .lineSpacing(2)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
}

#Preview {
    NavigationStack {
        ReviewsView(tryOnId: "1")
    }
}
