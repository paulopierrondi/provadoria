import SwiftUI

struct TryOnResultView: View {
    let tryOn: TryOn
    @Environment(\.dismiss) private var dismiss
    @State private var showShareSheet = false
    @State private var showSavedAlert = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                resultImageSection
                ratingSection
                fitAssessmentSection
                styleTipsSection
                occasionsSection
                actionButtons
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.neuralVoid.ignoresSafeArea())
        .navigationTitle("Resultado")
        .navigationBarTitleDisplayMode(.large)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.neuralVoid, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Fechar") {
                    dismiss()
                }
                .foregroundColor(.electricCyan)
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(items: [shareText])
        }
        .alert("Salvo!", isPresented: $showSavedAlert) {
            Button("OK") { }
        } message: {
            Text("A imagem foi salva na sua galeria.")
        }
    }
    
    private var shareText: String {
        "Confira meu look no ProvadorIA! \(tryOn.description) — Avaliação: \(String(format: "%.1f", tryOn.rating))/10"
    }
    
    private var resultImageSection: some View {
        VStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.electricCyan.opacity(0.2),
                            Color.neonPurple.opacity(0.2),
                            Color.neonPink.opacity(0.1)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 380)
                .overlay(
                    VStack(spacing: 16) {
                        Image(systemName: "person.fill.viewfinder")
                            .font(.system(size: 60))
                            .foregroundStyle(LinearGradient.cyanGradient)
                        
                        Text(tryOn.description)
                            .neuralBody()
                            .foregroundColor(.neuralWhite)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                        
                        Text("Preview gerado por IA")
                            .neuralCaption()
                            .foregroundColor(.gray)
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                colors: [.electricCyan.opacity(0.5), .neonPurple.opacity(0.5)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                )
                .cyanGlow()
            
            HStack(spacing: 8) {
                Image(systemName: "arrow.left.arrow.right")
                    .font(.caption)
                    .foregroundColor(.electricCyan)
                
                Text("Antes / Depois")
                    .neuralCaption()
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }
    }
    
    private var ratingSection: some View {
        HStack(spacing: 16) {
            VStack(spacing: 4) {
                Text(String(format: "%.1f", tryOn.rating))
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundStyle(LinearGradient.cyanGradient)
                
                Text("de 10")
                    .neuralCaption()
                    .foregroundColor(.gray)
            }
            .frame(width: 80)
            
            Divider()
                .background(Color.white.opacity(0.1))
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 4) {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= Int(tryOn.rating / 2) ? "star.fill" : "star")
                            .font(.caption)
                            .foregroundColor(.appWarning)
                    }
                }
                
                Text(ratingDescription)
                    .neuralBody()
                    .foregroundColor(.neuralWhite)
            }
            
            Spacer()
        }
        .padding(16)
        .neuralCard()
    }
    
    private var ratingDescription: String {
        switch tryOn.rating {
        case 0..<5: return "Precisa de ajustes"
        case 5..<7: return "Bom ajuste"
        case 7..<9: return "Excelente ajuste"
        default: return "Ajuste perfeito!"
        }
    }
    
    private var fitAssessmentSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "ruler")
                    .foregroundColor(.electricCyan)
                Text("Avaliação do Ajuste")
                    .neuralTitle()
                    .foregroundColor(.neuralWhite)
            }
            
            Text(tryOn.fitAssessment)
                .neuralBody()
                .foregroundColor(.gray)
                .lineSpacing(4)
        }
        .padding(16)
        .neuralCard()
    }
    
    private var styleTipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "lightbulb")
                    .foregroundColor(.neonPurple)
                Text("Dicas de Estilo")
                    .neuralTitle()
                    .foregroundColor(.neuralWhite)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(Array(tryOn.styleTips.enumerated()), id: \.offset) { index, tip in
                    HStack(alignment: .top, spacing: 10) {
                        Text("\(index + 1)")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .foregroundColor(.neonPurple)
                            .frame(width: 22, height: 22)
                            .background(Color.neonPurple.opacity(0.15))
                            .cornerRadius(6)
                        
                        Text(tip)
                            .neuralBody()
                            .foregroundColor(.gray)
                            .lineSpacing(2)
                        
                        Spacer()
                    }
                }
            }
        }
        .padding(16)
        .neuralCard()
    }
    
    private var occasionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "calendar.badge.clock")
                    .foregroundColor(.neonPink)
                Text("Ocasiões Recomendadas")
                    .neuralTitle()
                    .foregroundColor(.neuralWhite)
            }
            
            FlowLayout(spacing: 8) {
                ForEach(tryOn.occasions, id: \.self) { occasion in
                    Text(occasion)
                        .neuralTag()
                }
            }
        }
        .padding(16)
        .neuralCard()
    }
    
    private var actionButtons: some View {
        VStack(spacing: 12) {
            Button(action: {
                HapticFeedback.medium()
                showShareSheet = true
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "square.and.arrow.up")
                    Text("Compartilhar")
                }
            }
            .buttonStyle(NeuralButtonStyle())
            
            Button(action: {
                HapticFeedback.success()
                saveToGallery()
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "square.and.arrow.down")
                    Text("Salvar na Galeria")
                }
            }
            .buttonStyle(SecondaryNeuralButtonStyle())
        }
    }
    
    private func saveToGallery() {
        showSavedAlert = true
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x,
                                      y: bounds.minY + result.positions[index].y),
                         proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var rowHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                if x + size.width > maxWidth && x > 0 {
                    x = 0
                    y += rowHeight + spacing
                    rowHeight = 0
                }
                positions.append(CGPoint(x: x, y: y))
                rowHeight = max(rowHeight, size.height)
                x += size.width + spacing
            }
            
            self.size = CGSize(width: maxWidth, height: y + rowHeight)
        }
    }
}

#Preview {
    NavigationStack {
        TryOnResultView(tryOn: TryOn.sample)
    }
}
