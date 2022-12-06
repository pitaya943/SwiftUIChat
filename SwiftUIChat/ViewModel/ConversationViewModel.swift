//
//  ConversationViewModel.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import SwiftUI

class ConversationViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages").order(by: "timestamp", descending: false)
            query.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.recentMessages = documents.compactMap({ try? $0.data(as: Message.self) })
        }
    }
}
