//
//  CurrentUserProfileView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-21.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                // header view
                HStack {
                    Text(user.movie)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .onTapGesture {
                    showEditProfile.toggle()
                }
                
                // account info
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.movie)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text("test@gmail.com")
                    }
                }
                
                // legal section
                Section("Legal") {
                    Text("Terms of Service")
                }
                
                // logout and delete account section
                Section {
                    Button("Logout") {
                        print("DEBUG: Logout here")
                    }
                    .foregroundStyle(.red)
                    
                    Button("Delete Account") {
                        print("DEBUG: Delete account here")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
