import SwiftUI

struct ShimmerLoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<4) { _ in
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.neuralSurface)
                    .frame(height: 120)
                    .shimmer()
            }
        }
        .padding(.horizontal, 16)
    }
}

struct ShimmerCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.neuralSurface)
                .frame(height: 200)
                .shimmer()

            RoundedRectangle(cornerRadius: 6)
                .fill(Color.neuralSurface)
                .frame(width: 180, height: 16)
                .shimmer()

            RoundedRectangle(cornerRadius: 6)
                .fill(Color.neuralSurface)
                .frame(width: 120, height: 12)
                .shimmer()
        }
        .padding(16)
        .background(Color.neuralDark)
        .cornerRadius(16)
    }
}

#Preview {
    ShimmerLoadingView()
        .background(Color.neuralVoid)
}
