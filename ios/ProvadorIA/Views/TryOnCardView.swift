import SwiftUI

struct TryOnCardView: View {
    let tryOn: TryOn
    @State private var isVoted = false
    @State private var voteCount: Int
    @State private var showReviews = false
    
    init(tryOn: TryOn) {
        self.tryOn = tryOn
        _voteCount = State(initialValue: tryOn.votes)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            userInfoSection
            imageSection
            descriptionSection
            actionSection
        }
        .background(Color.appSurface)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.06), lineWidth: 1)
        )
    }
    
    private var userInfoSection: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.appAccentCyan.opacity(0.3), .appAccentPurple.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 40, height: 40)
                
                Image(systemName: tryOn.userAvatar)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(tryOn.userName)
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.white)
                
                Text(tryOn.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: { }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
        }
        .padding(16)
    }
    
    private var imageSection: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.appSurfaceLight,
                            Color.appSurface
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(height: 280)
                .padding(.horizontal, 12)
            
            VStack(spacing: 12) {
                Image(systemName: "person.fill.viewfinder")
                    .font(.system(size: 48))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.appAccentCyan.opacity(0.6), .appAccentPurple.opacity(0.6)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                HStack(spacing: 16) {
                    Label("Antes", systemImage: "person")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Image(systemName: "arrow.right")
                        .font(.caption)
                        .foregroundColor(.appAccentCyan)
                    
                    Label("Depois", systemImage: "person.fill")
                        .font(.caption)
                        .foregroundColor(.appAccentCyan)
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    ratingBadge
                }
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
        }
    }
    
    private var ratingBadge: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .font(.caption2)
                .foregroundColor(.appWarning)
            
            Text(String(format: "%.1f", tryOn.rating))
                .font(.caption.weight(.bold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.black.opacity(0.6))
        .cornerRadius(10)
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(tryOn.description)
                .font(.subheadline)
                .foregroundColor(.white)
                .lineLimit(2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(tryOn.occasions.prefix(3), id: \.self) { occasion in
                        Text(occasion)
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.appSurfaceLight)
                            .cornerRadius(6)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
    }
    
    private var actionSection: some View {
        HStack(spacing: 0) {
            Button(action: toggleVote) {
                HStack(spacing: 6) {
                    Image(systemName: isVoted ? "arrow.up.heart.fill" : "arrow.up.heart")
                        .font(.system(size: 18))
                        .foregroundColor(isVoted ? .appAccentPink : .gray)
                    
                    Text("\(voteCount)")
                        .font(.subheadline.weight(.medium))
                        .foregroundColor(isVoted ? .appAccentPink : .gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            
            Divider()
                .background(Color.white.opacity(0.06))
            
            Button(action: { showReviews = true }) {
                HStack(spacing: 6) {
                    Image(systemName: "star.bubble")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    
                    Text("Reviews")
                        .font(.subheadline.weight(.medium))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            
            Divider()
                .background(Color.white.opacity(0.06))
            
            Button(action: { }) {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
        }
        .padding(.horizontal, 8)
        .padding(.top, 8)
    }
    
    private func toggleVote() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            isVoted.toggle()
            voteCount += isVoted ? 1 : -1
        }
        
        Task {
            do {
                let newVotes = try await APIService.shared.voteTryOn(id: tryOn.id)
                await MainActor.run {
                    voteCount = newVotes
                }
            } catch {
                // Revert on error
                await MainActor.run {
                    isVoted.toggle()
                    voteCount += isVoted ? 1 : -1
                }
            }
        }
    }
}

#Preview {
    ScrollView {
        TryOnCardView(tryOn: TryOn.sample)
            .padding(.horizontal, 16)
    }
    .background(Color.appBackground)
}
