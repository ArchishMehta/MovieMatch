//
//  EditProfileView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-21.
//

import SwiftUI
struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var bio = ""
    @State private var favmovie = ""
    @Binding var name: String
    @Binding var email: String
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImageGridView(user: user)
                    .padding()
                
                VStack(spacing: 24) {
                    TextEditor(text: $bio)
                        .padding()
                        .frame(height: 64, alignment: .top)
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.separator), lineWidth: 1)
                        )
                        .padding(.horizontal)
                }
                
                VStack(alignment: .leading) {
                    Text("GENDER")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.leading)
                    HStack {
                        Text("Man")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("AGE")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.leading)
                    HStack {
                        Text("16")
                        Spacer()
                        Image(systemName: "calendar")
                            .imageScale(.small)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    EditProfileView(name: .constant("John Doe"), email: .constant("john.doe@example.com"), user: MockData.users[1])
}
