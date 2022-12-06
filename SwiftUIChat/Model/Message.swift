//
//  Message.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import FirebaseFirestoreSwift
import FirebaseFirestore

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
