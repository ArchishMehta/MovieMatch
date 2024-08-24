import SwiftUI

struct ProfileImageGridView: View {
    let user: User
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var selectedImageIndex: Int?

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0..<6, id: \.self) { index in
                if index < user.profileImageURLs.count {
                    Button(action: {
                        selectedImageIndex = index
                        isImagePickerPresented = true
                    }) {
                        Image(user.profileImageURLs[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageWidth, height: imageHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                } else {
                    Button(action: {
                        selectedImageIndex = index
                        isImagePickerPresented = true
                    }) {
                        ZStack(alignment: .bottomTrailing) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.secondarySystemBackground))
                                .frame(width: imageWidth, height: imageHeight)
                            
                            Image(systemName: "plus.circle.fill")
                                .imageScale(.large)
                                .foregroundStyle(Color(.secondaryLabel))
                                .offset(x: 4, y: 4)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isImagePickerPresented, onDismiss: handleImageSelection) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }

    private func handleImageSelection() {
        guard let selectedImage = selectedImage, let index = selectedImageIndex else { return }
        
        // Handle the logic for saving the image and updating the user's profileImageURLs array here
        print("DEBUG: Image selected for index \(index)")
    }
}

private extension ProfileImageGridView {
    var columns: [GridItem] {
        [
            .init(.flexible()),
            .init(.flexible()),
            .init(.flexible())
        ]
    }
    
    var imageWidth: CGFloat {
        return 110
    }
    
    var imageHeight: CGFloat {
        return 160
    }
}

#Preview {
    ProfileImageGridView(user: MockData.users[2])
}
