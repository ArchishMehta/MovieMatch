//
//  UserProfileView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-17.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @Environment(\.dismiss) private var dismiss
    @State private var currentImageIndex = 0
    
    var body: some View {
        VStack {
            HStack {
                Text(user.movie) // Correctly accessing the user's name
                    .font(.title2) // Correct font modifier usage
                    .fontWeight(.semibold)
                
                Text("\(user.year)") // Correctly accessing the user's age
                    .font(.title2)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill") // Correct system image name
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.blue) // Changed to a standard color or define it if it's custom
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ZStack(alignment: .top) {
                        Image(user.profileImageURLs[currentImageIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                            .overlay{
                                ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageURLs.count)
                            }
                        CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount:  user.profileImageURLs.count)
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Summary")
                            .fontWeight(.semibold)
                        Text("A short summary")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("Generas")
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "Popcorn.cirle")
                        
                        Text("Animation")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "Popcorn.cirle")
                        
                        Text("Comedy")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "Popcorn.cirle")
                        
                        Text("Adventure")
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    UserProfileView(user: MockData.users[0]) 
}
