//
//  CurrentUserProfileHeaderView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-21.
import SwiftUI

struct CurrentUserProfileHeaderView: View {
    let user: User
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImageURL: String?

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Button(action: {
                    isImagePickerPresented = true
                }) {
                    Image(uiImage: selectedImage ?? UIImage(named: user.profileImageURLs.first ?? "defaultProfileImage")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .background {
                            Circle()
                                .fill(Color(.systemGray6))
                                .frame(width: 148, height: 148)
                                .shadow(radius: 10)
                        }
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                        )
                }

                Image(systemName: "pencil.circle.fill")
                    .foregroundStyle(Color.blue)
                    .background {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 36, height: 36)
                    }
                    .offset(x: -10, y: -10)
            }
            Text("\(user.movie), \(user.year)")
                .font(.title2)
                .fontWeight(.light)
                .padding(.top, 8)
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 260)
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage)
                .onChange(of: selectedImage) { oldValue, newValue in
                    if let newValue = newValue {
                        saveImage(newValue)
                    }
                }
        }
    }

    func saveImage(_ image: UIImage) {
        // Convert UIImage to data
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            // Save the image data locally or upload it to a server and get the URL
            let fileName = UUID().uuidString + ".jpg"
            let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
            
            do {
                try imageData.write(to: fileURL)
                profileImageURL = fileURL.absoluteString
                print("DEBUG: Image saved at \(fileURL.absoluteString)")
            } catch {
                print("Error saving image: \(error)")
            }
        }
    }
}

#Preview {
    CurrentUserProfileHeaderView(user: MockData.users[0])
}
