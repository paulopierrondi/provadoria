import SwiftUI
import PhotosUI

struct TryOnView: View {
    @State private var userPhotoItem: PhotosPickerItem?
    @State private var clothingPhotoItem: PhotosPickerItem?
    @State private var userPhotoData: Data?
    @State private var clothingPhotoData: Data?
    @State private var description = ""
    @State private var isGenerating = false
    @State private var showResult = false
    @State private var result: TryOn?
    @State private var errorMessage: String?
    @State private var showError = false
    @AppStorage("hasAcceptedAIPhotoProcessing") private var hasAcceptedAIPhotoProcessing = false
    @Environment(\.dismiss) private var dismiss
    
    private var isFormValid: Bool {
        userPhotoData != nil
            && clothingPhotoData != nil
            && !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && hasAcceptedAIPhotoProcessing
    }
    
    private var currentStep: Int {
        if userPhotoData == nil { return 0 }
        if clothingPhotoData == nil { return 1 }
        if description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return 2 }
        return 3
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 32) {
                headerSection
                stepIndicatorSection
                aiConsentSection
                photoUploadSection
                directionNotesSection
                generateButton
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
        }
        .background(Color.cherryBone.ignoresSafeArea())
        .fullScreenCover(item: $result) { tryOn in
            TryOnResultView(tryOn: tryOn)
        }
        .alert("Erro", isPresented: $showError) {
            Button("OK") { }
        } message: {
            Text(errorMessage ?? "Ocorreu um erro inesperado.")
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("DIREÇÃO DE ARTE")
                .eyebrow()
                .foregroundColor(.cherryAccent)
            
            Text("A peça, ")
                .font(.system(size: 36, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)
            +
            Text("em foco.")
                .font(.system(size: 36, weight: .regular, design: .serif))
                .italic()
                .foregroundColor(.cherryInk)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var stepIndicatorSection: some View {
        StepIndicator(
            currentStep: currentStep,
            totalSteps: 4,
            labels: ["Sua Foto", "Roupa", "Descrição", "Gerar"]
        )
        .padding(.horizontal, 8)
    }
    
    private var photoUploadSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Rectangle()
                    .fill(Color.cherryPaper)
                    .frame(height: 350)
                    .overlay(
                        Rectangle()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                            .foregroundColor(Color.cherryMid.opacity(0.3))
                    )
                
                VStack(spacing: 16) {
                    Text("arraste a foto aqui")
                        .font(.system(size: 24, weight: .regular, design: .serif))
                        .italic()
                        .foregroundColor(.cherryMid)
                    
                    HStack(spacing: 12) {
                        PhotosPicker(selection: $userPhotoItem, matching: .images) {
                            HStack(spacing: 8) {
                                Image(systemName: "photo.on.rectangle")
                                Text("Galeria")
                            }
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .foregroundColor(.cherryBone)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.cherryInk)
                        }
                    }
                }
            }
            
            HStack(spacing: 16) {
                PhotoUploadCard(
                    title: "Sua foto",
                    icon: "person.crop.rectangle.fill",
                    photoData: $userPhotoData,
                    photoItem: $userPhotoItem,
                    isCompleted: userPhotoData != nil
                )
                
                PhotoUploadCard(
                    title: "Foto da roupa",
                    icon: "tshirt.fill",
                    photoData: $clothingPhotoData,
                    photoItem: $clothingPhotoItem,
                    isCompleted: clothingPhotoData != nil
                )
            }
        }
    }
    
    private var directionNotesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Notas da direção")
                .font(.system(size: 20, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)
            
            VStack(alignment: .leading, spacing: 12) {
                DirectionNote(number: 1, title: "Fundo limpo", noteBody: "Prefira fundo neutro para melhor recorte da IA.")
                DirectionNote(number: 2, title: "Corpo inteiro", noteBody: "A foto do corpo inteiro gera o melhor resultado.")
                DirectionNote(number: 3, title: "Boa iluminação", noteBody: "Evite sombras fortes que confundem o modelo.")
            }
        }
    }

    private var aiConsentSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Privacidade da IA")
                .font(.system(size: 20, weight: .regular, design: .serif))
                .foregroundColor(.cherryInk)

            Text("Para gerar o try-on, o ProvadorIA processa sua foto, a foto da roupa e a descrição na API do ProvadorIA e no provedor de IA Google Gemini. Usamos esses dados somente para criar o resultado, sem venda, tracking ou treinamento de modelos.")
                .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(.cherryMid)
                .lineSpacing(3)

            Toggle(isOn: $hasAcceptedAIPhotoProcessing) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Autorizo o processamento por IA")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundColor(.cherryInk)
                    Text("Você pode desativar antes de gerar um novo try-on.")
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(.cherryMid)
                }
            }
            .tint(.cherryAccent)
        }
        .padding(16)
        .background(Color.cherryPaper)
        .overlay(
            Rectangle()
                .stroke(Color.cherryLine, lineWidth: 1)
        )
    }
    
    private var generateButton: some View {
        Button(action: generateTryOn) {
            if isGenerating {
                HStack(spacing: 12) {
                    ProgressView()
                        .tint(.cherryBone)
                    Text("Gerando preview...")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(.cherryBone)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            } else {
                HStack(spacing: 8) {
                    Text("03 · Gerar try-on →")
                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                        .tracking(0.5)
                }
                .foregroundColor(.cherryBone)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            }
        }
        .background(isFormValid && !isGenerating ? Color.cherryInk : Color.cherryMid.opacity(0.3))
        .disabled(!isFormValid || isGenerating)
        .opacity(isGenerating ? 0.7 : (isFormValid ? 1.0 : 0.5))
    }
    
    private func generateTryOn() {
        HapticFeedback.medium()
        isGenerating = true
        
        Task {
            do {
                let tryOn = try await APIService.shared.generateTryOn(
                    userPhoto: userPhotoData,
                    clothingPhoto: clothingPhotoData,
                    description: description
                )
                await MainActor.run {
                    isGenerating = false
                    result = tryOn
                    HapticFeedback.success()
                }
            } catch {
                await MainActor.run {
                    isGenerating = false
                    errorMessage = "Não foi possível gerar o try-on. Verifique sua conexão e tente novamente."
                    showError = true
                    HapticFeedback.error()
                }
            }
        }
    }
}

struct DirectionNote: View {
    let number: Int
    let title: String
    let noteBody: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(number)")
                .font(.system(size: 14, weight: .regular, design: .serif))
                .italic()
                .foregroundColor(.cherryAccent)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .foregroundColor(.cherryInk)
                Text(noteBody)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(.cherryMid)
                    .lineSpacing(2)
            }
        }
    }
}

struct PhotoUploadCard: View {
    let title: String
    let icon: String
    @Binding var photoData: Data?
    @Binding var photoItem: PhotosPickerItem?
    var isCompleted: Bool = false
    
    var body: some View {
        PhotosPicker(selection: $photoItem, matching: .images) {
            VStack(spacing: 12) {
                if let photoData, let uiImage = UIImage(data: photoData) {
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 160)
                            .clipped()
                        
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.cherryAccent)
                            .padding(6)
                            .background(Color.cherryBone)
                    }
                } else {
                    Rectangle()
                        .fill(Color.cherryPaper)
                        .frame(width: 120, height: 160)
                        .overlay(
                            VStack(spacing: 8) {
                                Image(systemName: icon)
                                    .font(.system(size: 32))
                                    .foregroundColor(.cherryMid)
                                Image(systemName: "plus")
                                    .font(.system(size: 16))
                                    .foregroundColor(.cherryAccent)
                            }
                        )
                        .overlay(
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                                .foregroundColor(Color.cherryMid.opacity(0.3))
                        )
                }
                
                Text(title)
                    .font(.system(size: 11, weight: .medium, design: .monospaced))
                    .tracking(0.8)
                    .foregroundColor(isCompleted ? .cherryAccent : .cherryMid)
            }
        }
        .onChange(of: photoItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    await MainActor.run {
                        photoData = data
                        HapticFeedback.light()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TryOnView()
    }
}
