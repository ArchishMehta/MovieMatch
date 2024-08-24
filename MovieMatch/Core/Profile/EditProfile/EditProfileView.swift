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
    @State private var isGenderPickerPresented = false
    @State private var isAgePickerPresented = false
    @State private var selectedGender = "Man"
    @State private var selectedAge = 16
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
                    Button(action: {
                        isGenderPickerPresented = true
                    }) {
                        HStack {
                            Text(selectedGender)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                        .cornerRadius(8)
                    }
                    .sheet(isPresented: $isGenderPickerPresented) {
                        GenderPickerView(selectedGender: $selectedGender)
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("AGE")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.leading)
                    Button(action: {
                        isAgePickerPresented = true
                    }) {
                        HStack {
                            Text("\(selectedAge)")
                            Spacer()
                            Image(systemName: "calendar")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                        .cornerRadius(8)
                    }
                    .sheet(isPresented: $isAgePickerPresented) {
                        AgePickerView(selectedAge: $selectedAge)
                    }
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

struct GenderPickerView: View {
    @Binding var selectedGender: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                Button("Man") {
                    selectedGender = "Man"
                    dismiss()
                }
                Button("Woman") {
                    selectedGender = "Woman"
                    dismiss()
                }
                Button("Other") {
                    selectedGender = "Other"
                    dismiss()
                }
            }
            .navigationTitle("Select Gender")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AgePickerView: View {
    @Binding var selectedAge: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(16..<100) { age in
                    Button("\(age)") {
                        selectedAge = age
                        dismiss()
                    }
                }
            }
            .navigationTitle("Select Age")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
#Preview {
    EditProfileView(name: .constant("John Doe"), email: .constant("john.doe@example.com"), user: MockData.users[1])
}
