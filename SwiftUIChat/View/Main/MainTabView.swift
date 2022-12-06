//
//  MainTabView.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                TabView(selection: $selectedIndex) {
                    ConversationsView()
                        .tabItem { Image(systemName: "bubble.left") }
                        .tag(0)
                    
                    ChannelsView()
                        .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                        .tag(1)
                    
                    SettingsView(user: user)
                        .tabItem { Image(systemName: "gear") }
                        .tag(2)
                }
                .navigationTitle(tabTitle)
            }
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Channels"
        case 2: return "Settings"
        default: return ""
        }
    }
}
