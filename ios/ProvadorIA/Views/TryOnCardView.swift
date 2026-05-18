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
        .background(Color.cherryPaper)
        .overlay(
            Rectangle()
                .stroke(Color.cherryLine, lineWidth: 1)
        )
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
                Rectangle()
                    .fill(Color.cherryInk)
                    .frame(width: 32, height: 32)
                
                Text(String(tryOn.userName.prefix(1)))
                    .font(.system(size: 14, weight: .medium, design: .serif))
                    .foregroundColor(.cherryBone)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(tryOn.userName)
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .foregroundColor(.cherryInk)
                
                Text(tryOn.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .font(.system(size: 11, weight: .regular, design: .monospaced))
                    .tracking(0.5)
                    .foregroundColor(.cherryMid)
            }
            
            Spacer()
            
            Button(action: { }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.cherryMid)
            }
        }
        .padding(16)
    }
    
    private var imageSection: some View {
        ZStack {
            Rectangle()
                .fill(Color.cherryBone)
                .frame(height: 280)
                .padding(.horizontal, 12)
            
            VStack(spacing: 12) {
                Image(systemName: "person.fill.viewfinder")
                    .font(.system(size: 48))
                    .foregroundColor(.cherryMid.opacity(0.6))
                
                HStack(spacing: 16) {
                    Text("Antes")
                        .font(.system(size: 12, weight: .medium, design: .monospaced))
                        .tracking(0.5)
                        .foregroundColor(.cherryMid)
                    
                    Image(systemName: "arrow.right")
                        .font(.caption)
                        .foregroundColor(.cherryAccent)
                    
                    Text("Depois")
                        .font(.system(size: 12, weight: .medium, design: .monospaced))
                        .tracking(0.5)
                        .foregroundColor(.cherryAccent)
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
            Text(String(format: "%.1f", tryOn.rating))
                .font(.system(size: 14, weight: .bold, design: .serif))
                .italic()
                .foregroundColor(.cherryInk)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.cherryBone)
        .overlay(
            Rectangle()
                .stroke(Color.cherryLine, lineWidth: 1)
        )
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(tryOn.description)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundColor(.cherryInk)
                .lineLimit(2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(tryOn.occasions.prefix(3), id: \.self) { occasion in
                        Text(occasion)
                            .font(.system(size: 11, weight: .medium, design: .monospaced))
                            .tracking(0.3)
                            .foregroundColor(.cherryMid)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.cherryBone)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.cherryLine, lineWidth: 1)
                            )
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
                        .foregroundColor(isVoted ? .cherryAccent : .cherryMid)
                    
                    Text("\(voteCount)")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(isVoted ? .cherryAccent : .cherryMid)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            
            Rectangle()
                .fill(Color.cherryLine)
                .frame(width: 1)
            
            Button(action: {
                HapticFeedback.light()
                showReviews = true
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "star.bubble")
                        .font(.system(size: 18))
                        .foregroundColor(.cherryMid)
                    
                    Text("Reviews")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(.cherryMid)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            
            Rectangle()
                .fill(Color.cherryLine)
                .frame(width: 1)
            
            Button(action: {
                HapticFeedback.light()
                showShareSheet = true
            }) {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 18))
                    .foregroundColor(.cherryMid)
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
    .background(Color.cherryBone)
}
