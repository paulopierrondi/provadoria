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
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                photoUploadSection
                descriptionSection
                generateButton
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .navigationTitle("Novo Try-On")
        .navigationBarTitleDisplayMode(.large)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.appBackground, for: .navigationBar)
        .fullScreenCover(item: $result) { tryOn in
            TryOnResultView(tryOn: tryOn)
        }
        .alert("Erro", isPresented: $showError) {
            Button("OK") { }
        } message: {
            Text(errorMessage ?? "Ocorreu um erro inesperado.")
        }
    }
    
    private var photoUploadSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                PhotoUploadCard(
                    title: "Sua foto",
                    icon: "person.crop.rectangle.fill",
                    photoData: $userPhotoData,
                    photoItem: $userPhotoItem
                )
                
                PhotoUploadCard(
                    title: "Foto da roupa",
                    icon: "tshirt.fill",
                    photoData: $clothingPhotoData,
                    photoItem: $clothingPhotoItem
                )
            }
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Descrição da roupa")
                .font(.headline)
                .foregroundColor(.white)
            
            TextEditor(text: $description)
                .font(.body)
                .foregroundColor(.white)
                .scrollContentBackground(.hidden)
                .frame(minHeight: 100)
                .padding(12)
                .background(Color.appSurfaceLight)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        }
    }
    
    private var generateButton: some View {
        Button(action: generateTryOn) {
            if isGenerating {
                HStack(spacing: 12) {
                    ProgressView()
                        .tint(.white)
                    Text("Gerando preview...")
                        .font(.headline.weight(.semibold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            } else {
                Text("Gerar Preview")
                    .font(.headline.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
            }
        }
        .background(
            LinearGradient(
                colors: [.appAccentCyan, .appAccentPurple],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(16)
        .disabled(isGenerating)
        .opacity(isGenerating ? 0.7 : 1.0)
    }
    
    private func generateTryOn() {
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
                }
            } catch {
                await MainActor.run {
                    isGenerating = false
                    errorMessage = error.localizedDescription
                    showError = true
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
    
    var body: some View {
        PhotosPicker(selection: $photoItem, matching: .images) {
            VStack(spacing: 12) {
                if let photoData, let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.appSurfaceLight)
                        .frame(width: 120, height: 160)
                        .overlay(
                            VStack(spacing: 8) {
                                Image(systemName: icon)
                                    .font(.system(size: 32))
                                    .foregroundColor(.gray)
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.appAccentCyan)
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                                .foregroundColor(Color.white.opacity(0.1))
                        )
                }
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .onChange(of: photoItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    await MainActor.run {
                        photoData = data
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
