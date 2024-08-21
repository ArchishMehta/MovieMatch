//
//  CurrentUserProfileView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-21.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    var body: some View {
        NavigationStack {
            List {
                // header view
                CurrentUserProfileView(user: user)
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
                Section("Legal") {
                    Text("Terms of Service")
                }
                Section {
                    Button("Logout") {
                        print("DEBUG: Logout here")
                    }
                    .foregroundStyle(.red)
                    
                    Button("Delete Account") {
                        print("DEBUG: Delete account here")
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
