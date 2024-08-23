//  MainTabView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-15.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CardStackView()
                .tabItem {
                    Image(systemName: "film")
                }
                .tag(0)
            
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            CurrentUserProfileView(user: MockData.users[0])
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(2)  
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
