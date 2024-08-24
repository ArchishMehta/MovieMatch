import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    @State private var name: String = ""
    @State private var email: String = "test@gmail.com"
    @State private var showDeleteConfirmation = false
    @State private var showTermsOfService = false
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                // Header view with circular profile picture
                HStack {
                    Image(user.profileImageURLs.first ?? "defaultProfileImage") // Use a default image if none available
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4)) // Optional: add a border
                        .shadow(radius: 5) // Optional: add shadow for better visibility
                    
                    VStack(alignment: .leading) {
                        Text(user.movie)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Email: \(email)") // Display email or other info
                            .font(.subheadline)
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                }
                .onTapGesture {
                    showEditProfile.toggle()
                }
                
                // Account info
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        TextField("Enter your name", text: $name)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        TextField("Enter your email", text: $email)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                }
                
                // Legal section
                Section("Legal") {
                    Button("Terms of Service") {
                        showTermsOfService.toggle()
                    }
                    .sheet(isPresented: $showTermsOfService) {
                        TermsOfServiceView()
                    }
                }
                
                // Logout and delete account section
                Section {
                    Button("Logout") {
                        logout()
                    }
                    .foregroundStyle(.red)
                    
                    Button("Delete Account") {
                        showDeleteConfirmation.toggle()
                    }
                    .foregroundStyle(.red)
                    .confirmationDialog("Are you sure you want to delete your account?", isPresented: $showDeleteConfirmation) {
                        Button("Delete", role: .destructive) {
                            deleteAccount()
                        }
                        Button("Cancel", role: .cancel) { }
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(name: $name, email: $email, user: user)
            }
        }
    }
    
    // MARK: - Functions
    
    func logout() {
        // Perform logout actions, e.g., clear user session and navigate to login screen
        print("DEBUG: User logged out")
    }
    
    func deleteAccount() {
        // Perform delete account actions, e.g., call API to delete the user's account
        print("DEBUG: Account deleted")
    }
}

struct TermsOfServiceView: View {
    var body: some View {
        NavigationStack {
            Text("Terms of Service Content")
                .padding()
                .navigationTitle("Terms of Service")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
