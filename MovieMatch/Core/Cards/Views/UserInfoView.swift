//
//  UserInfoView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//

import SwiftUI
struct UserInfoView: View {
    var body: some View {
        VStack(alignment:.leading ) {
            HStack {
                Text("Soul")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("2020")
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
    UserInfoView()
}
