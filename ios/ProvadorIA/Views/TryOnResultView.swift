import SwiftUI

struct TryOnResultView: View {
    let tryOn: TryOn
    @Environment(\.dismiss) private var dismiss
    @State private var showShareSheet = false
    @State private var showSavedAlert = false
    @State private var showBeforeAfter = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                coverMasthead
                coverHero
                beforeAfterToggle
                articleBody
                actionButtons
            }
        }
        .background(Color.cherryInk.ignoresSafeArea())
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
    
    private var coverMasthead: some View {
        HStack {
            Button(action: { dismiss() }) {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 14, weight: .medium))
                    Text("Voltar")
                        .font(.system(size: 14, weight: .medium, design: .default))
                }
                .foregroundColor(.cherryBone)
            }
            
            Spacer()
            
            HStack(spacing: 4) {
                Text("Provador")
                    .font(.system(size: 14, weight: .regular, design: .serif))
                    .foregroundColor(.cherryBone)
                Text("ia")
                    .font(.system(size: 14, weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(.cherryAccent)
            }
            
            Spacer()
            
            Button(action: { showShareSheet = true }) {
                Text("Compartilhar")
                    .font(.system(size: 14, weight: .medium, design: .default))
                    .foregroundColor(.cherryBone)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
    
    private var coverHero: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(
                colors: [.cherryAccent, .cherryAccentDeep],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(height: 480)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("O LOOK DE HOJE")
                    .eyebrow()
                    .foregroundColor(.cherryBone.opacity(0.8))
                
                Text("Cai ")
                    .font(.system(size: 56, weight: .regular, design: .serif))
                    .foregroundColor(.cherryBone)
                +
                Text("perfeito.")
                    .font(.system(size: 56, weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(.cherryBone)
                
                Text(tryOn.description)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(.cherryBone.opacity(0.9))
                    .lineLimit(2)
                    .frame(maxWidth: 240, alignment: .leading)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
            
            VStack(alignment: .trailing, spacing: 4) {
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("Caimento")
                            .font(.system(size: 11, weight: .regular, design: .monospaced))
                            .tracking(1.5)
                            .textCase(.uppercase)
                            .foregroundColor(.cherryBone.opacity(0.8))
                        
                        Text(String(format: "%.1f", tryOn.rating))
                            .font(.system(size: 80, weight: .regular, design: .serif))
                            .italic()
                            .foregroundColor(.cherryBone)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Spacer()
                Text("Marina Souza")
                    .font(.system(size: 13, weight: .medium, design: .default))
                    .foregroundColor(.cherryBone)
                Text("Gerado por Gemini 2.0")
                    .font(.system(size: 11, weight: .regular, design: .monospaced))
                    .tracking(0.5)
                    .foregroundColor(.cherryBone.opacity(0.7))
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
        }
    }
    
    private var beforeAfterToggle: some View {
        HStack(spacing: 16) {
            Button(action: { showBeforeAfter = false }) {
                Text("Resultado")
                    .font(.system(size: 13, weight: .medium, design: .monospaced))
                    .tracking(0.5)
                    .foregroundColor(!showBeforeAfter ? .cherryBone : .cherryMid)
                    .padding(.vertical, 8)
                    .overlay(
                        Rectangle()
                            .fill(!showBeforeAfter ? Color.cherryBone : Color.clear)
                            .frame(height: 1),
                        alignment: .bottom
                    )
            }
            
            Button(action: { showBeforeAfter = true }) {
                Text("Antes / Depois")
                    .font(.system(size: 13, weight: .medium, design: .monospaced))
                    .tracking(0.5)
                    .foregroundColor(showBeforeAfter ? .cherryBone : .cherryMid)
                    .padding(.vertical, 8)
                    .overlay(
                        Rectangle()
                            .fill(showBeforeAfter ? Color.cherryBone : Color.clear)
                            .frame(height: 1),
                        alignment: .bottom
                    )
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
    
    private var articleBody: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Analysis header
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Análise · Caimento")
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(.cherryBone)
                    Text("\(tryOn.description) · R$ 289")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(.cherryMid)
                }
                
                Spacer()
            }
            
            // Score rows
            VStack(spacing: 16) {
                ScoreRow(label: "Caimento", value: tryOn.rating)
                ScoreRow(label: "Cor", value: min(tryOn.rating + 0.3, 10.0))
                ScoreRow(label: "Estilo", value: min(tryOn.rating + 0.1, 10.0))
                ScoreRow(label: "Tamanho ideal", value: tryOn.rating)
            }
            
            Divider()
                .background(Color.cherryMid.opacity(0.3))
            
            // Style tips
            VStack(alignment: .leading, spacing: 16) {
                Text("Edit · Como compor")
                    .font(.system(size: 20, weight: .regular, design: .serif))
                    .foregroundColor(.cherryBone)
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(Array(tryOn.styleTips.enumerated()), id: \.offset) { index, tip in
                        HStack(alignment: .top, spacing: 12) {
                            Text("\(index + 1)")
                                .font(.system(size: 14, weight: .regular, design: .serif))
                                .italic()
                                .foregroundColor(.cherryAccent)
                                .frame(width: 24)
                            
                            Text(tip)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .foregroundColor(.cherryBone.opacity(0.9))
                                .lineSpacing(2)
                            
                            Spacer()
                        }
                    }
                }
            }
            
            Divider()
                .background(Color.cherryMid.opacity(0.3))
            
            // Occasions
            VStack(alignment: .leading, spacing: 12) {
                Text("Veja também — ocasiões")
                    .font(.system(size: 14, weight: .medium, design: .monospaced))
                    .tracking(0.5)
                    .textCase(.uppercase)
                    .foregroundColor(.cherryMid)
                
                FlowLayout(spacing: 8) {
                    ForEach(tryOn.occasions, id: \.self) { occasion in
                        Text(occasion)
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .foregroundColor(.cherryBone)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.cherryMid.opacity(0.5), lineWidth: 1)
                            )
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
    }
    
    private var actionButtons: some View {
        HStack(spacing: 12) {
            Button(action: {
                HapticFeedback.medium()
            }) {
                HStack(spacing: 8) {
                    Text("Comprar (R$ 289)")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                }
                .foregroundColor(.cherryInk)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.cherryBone)
            }
            
            Button(action: {
                HapticFeedback.success()
                showSavedAlert = true
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "bookmark")
                    Text("Salvar")
                }
                .font(.system(size: 15, weight: .semibold, design: .default))
                .foregroundColor(.cherryBone)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .overlay(
                    Rectangle()
                        .stroke(Color.cherryBone, lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color.cherryInk)
    }
    
    private func saveToGallery() {
        showSavedAlert = true
    }
}

struct ScoreRow: View {
    let label: String
    let value: Double
    
    var body: some View {
        HStack(spacing: 12) {
            Text(label)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.cherryMid)
                .frame(width: 100, alignment: .leading)
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.cherryMid.opacity(0.2))
                        .frame(height: 2)
                    
                    Rectangle()
                        .fill(Color.cherryAccent)
                        .frame(width: geo.size.width * CGFloat(value / 10.0), height: 2)
                }
            }
            .frame(height: 2)
            
            Text(String(format: "%.1f", value))
                .font(.system(size: 14, weight: .medium, design: .monospaced))
                .tracking(0.5)
                .foregroundColor(.cherryBone)
                .frame(width: 40, alignment: .trailing)
        }
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
