//
//  User.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}

let mock_user = User(id: "123213123", username: "Test", fullname: "Fullname", email: "123@gmail.com", profileImageUrl: "gs://swiftuichatmvvm.appspot.com/profile_images/anya.jpeg")
