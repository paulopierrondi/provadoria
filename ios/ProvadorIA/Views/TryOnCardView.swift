import SwiftUI

struct TryOnCardView: View {
    let tryOn: TryOn
    @State private var isVoted = false
    @State private var voteCount: Int
    @State private var showReviews = false
    @State private var showShareSheet = false
    
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
        .background(Color.neuralDark)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.electricCyan.opacity(0.1), lineWidth: 1)
        )
        .shadow(color: Color.electricCyan.opacity(0.05), radius: 12, x: 0, y: 4)
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(items: ["Confira este look no ProvadorIA! \(tryOn.description)"])
        }
        .navigationDestination(isPresented: $showReviews) {
            ReviewsView(tryOnId: tryOn.id)
        }
    }
    
    private var userInfoSection: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.electricCyan.opacity(0.12))
                    .frame(width: 40, height: 40)
                
                Image(systemName: tryOn.userAvatar)
                    .font(.system(size: 20))
                    .foregroundColor(.neuralWhite)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(tryOn.userName)
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.neuralWhite)
                
                Text(tryOn.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .neuralCaption()
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
                .fill(LinearGradient.voidGradient)
                .frame(height: 280)
                .padding(.horizontal, 12)
            
            VStack(spacing: 12) {
                Image(systemName: "person.fill.viewfinder")
                    .font(.system(size: 48))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.electricCyan.opacity(0.6), .neonPurple.opacity(0.6)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                HStack(spacing: 16) {
                    Label("Antes", systemImage: "person")
                        .neuralCaption()
                        .foregroundColor(.gray)
                    
                    Image(systemName: "arrow.right")
                        .font(.caption)
                        .foregroundColor(.electricCyan)
                    
                    Label("Depois", systemImage: "person.fill")
                        .neuralCaption()
                        .foregroundColor(.electricCyan)
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
                .foregroundColor(.neuralWhite)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.black.opacity(0.6))
        .cornerRadius(10)
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(tryOn.description)
                .neuralBody()
                .foregroundColor(.neuralWhite)
                .lineLimit(2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(tryOn.occasions.prefix(3), id: \.self) { occasion in
                        Text(occasion)
                            .neuralCaption()
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.neuralSurface)
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
                        .foregroundColor(isVoted ? .electricCyan : .gray)
                    
                    Text("\(voteCount)")
                        .font(.subheadline.weight(.medium))
                        .foregroundColor(isVoted ? .electricCyan : .gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            
            Divider()
                .background(Color.white.opacity(0.06))
            
            Button(action: {
                HapticFeedback.light()
                showReviews = true
            }) {
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
            
            Button(action: {
                HapticFeedback.light()
                showShareSheet = true
            }) {
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
        HapticFeedback.medium()
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            isVoted.toggle()
            voteCount += isVoted ? 1 : -1
        }
        
        Task {
            do {
                let newVotes = try await APIService.shared.voteTryOn(id: tryOn.id)
                await MainActor.run {
                    voteCount = newVotes
                    if isVoted {
                        HapticFeedback.success()
                    }
                }
            } catch {
                await MainActor.run {
                    isVoted.toggle()
                    voteCount += isVoted ? 1 : -1
                    HapticFeedback.error()
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
    .background(Color.neuralVoid)
}
