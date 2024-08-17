//
//  UserInfoView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//

import SwiftUI
struct UserInfoView: View {
    
    let userInfo: User
    
    var body: some View {
        VStack(alignment:.leading ) {
            HStack {
                Text(userInfo.movie)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text(String(userInfo.year))
                    .font(.title)
                    .fontWeight(.light)
                
                Spacer()
                
                Button {
                    print("DEBUG: Show profile here ..")
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            
            Text("Animation | Adventure ")
                .font(.subheadline)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom))
    }
}
#Preview {
    UserInfoView(userInfo: User(id: "", movie: "", year: 0, profileImageURLs: [
    ]))
}
