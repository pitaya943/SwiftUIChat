//
//  ConversationsView.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink("", destination: ChatView(user: user), isActive: $showChatView)
            }
            
            // chats
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.recentMessages) { message in
                        ConversationCell(viewModel: ConversationCellViewModel(message))
                    }
                }
            }
            
            // floating button
            Button {
                showNewMessageView.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showNewMessageView, onDismiss: nil) {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            }

        }
        .onAppear { viewModel.fetchRecentMessages() }
    }
}
