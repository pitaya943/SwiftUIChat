//
//  AuthViewModel.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import Firebase
import UIKit
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("DEBUG: Failed to log in with error \(err.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("DEBUG: Failed to register with error \(err.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempCurrentUser = user
            
            let data: [String : Any] = ["email": email,
                                        "username": username,
                                        "fullname": fullname]
            COLLECTION_USER.document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USER.document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
                self.userSession = self.tempCurrentUser
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USER.document(uid).getDocument { snapshot, err in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
    
}
