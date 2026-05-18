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
    @Environment(\.dismiss) private var dismiss
    
    private var isFormValid: Bool {
        userPhotoData != nil && clothingPhotoData != nil && !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    private var currentStep: Int {
        if userPhotoData == nil { return 0 }
        if clothingPhotoData == nil { return 1 }
        if description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return 2 }
        return 3
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                stepIndicatorSection
                photoUploadSection
                descriptionSection
                generateButton
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.neuralVoid.ignoresSafeArea())
        .navigationTitle("Novo Try-On")
        .navigationBarTitleDisplayMode(.large)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.neuralVoid, for: .navigationBar)
        .fullScreenCover(item: $result) { tryOn in
            TryOnResultView(tryOn: tryOn)
        }
        .alert("Erro", isPresented: $showError) {
            Button("OK") { }
        } message: {
            Text(errorMessage ?? "Ocorreu um erro inesperado.")
        }
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
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Descrição da roupa")
                .neuralTitle()
                .foregroundColor(.neuralWhite)
            
            TextEditor(text: $description)
                .neuralBody()
                .foregroundColor(.neuralWhite)
                .scrollContentBackground(.hidden)
                .frame(minHeight: 100)
                .neuralTextField()
        }
    }
    
    private var generateButton: some View {
        Button(action: generateTryOn) {
            if isGenerating {
                HStack(spacing: 12) {
                    ProgressView()
                        .tint(.neuralWhite)
                    Text("Gerando preview...")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(.neuralWhite)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            } else {
                HStack(spacing: 8) {
                    Image(systemName: "sparkles")
                    Text("Gerar Preview")
                }
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(.neuralWhite)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            }
        }
        .background(
            isFormValid && !isGenerating
                ? AnyView(LinearGradient.cyanGradient)
                : AnyView(Color.neuralSurface)
        )
        .cornerRadius(14)
        .disabled(!isFormValid || isGenerating)
        .opacity(isGenerating ? 0.7 : (isFormValid ? 1.0 : 0.5))
        .shadow(color: Color.electricCyan.opacity(isFormValid && !isGenerating ? 0.3 : 0), radius: 12, x: 0, y: 4)
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
                    errorMessage = error.localizedDescription
                    showError = true
                    HapticFeedback.error()
                }
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
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.electricCyan)
                            .background(Circle().fill(Color.neuralVoid))
                            .offset(x: 4, y: -4)
                    }
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient.voidGradient)
                        .frame(width: 120, height: 160)
                        .overlay(
                            VStack(spacing: 8) {
                                Image(systemName: icon)
                                    .font(.system(size: 32))
                                    .foregroundColor(.gray)
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.electricCyan)
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                                .foregroundColor(Color.electricCyan.opacity(0.15))
                        )
                }
                
                Text(title)
                    .font(.system(size: 11, weight: .medium, design: .monospaced))
                    .tracking(0.8)
                    .foregroundColor(isCompleted ? .electricCyan : .gray)
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
