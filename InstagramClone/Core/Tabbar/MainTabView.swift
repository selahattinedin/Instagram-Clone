//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Selahattin EDİN on 11.12.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("UploadPost")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart.fill")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }

        }.accentColor(Color("tabBarItemColor"))
    }
}

#Preview {
    MainTabView()
}
