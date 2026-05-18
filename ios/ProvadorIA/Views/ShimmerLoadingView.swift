import SwiftUI

struct ShimmerLoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<3) { _ in
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.cherryPaper)
                        .frame(width: 140, height: 180)
                        .overlay(
                            Rectangle()
                                .stroke(Color.cherryLine, lineWidth: 1)
                        )
                        .shimmer()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.cherryPaper)
                            .frame(width: 120, height: 16)
                            .shimmer()
                        
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.cherryPaper)
                            .frame(width: 80, height: 12)
                            .shimmer()
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ShimmerLoadingView()
        .padding()
        .background(Color.cherryBone)
}
