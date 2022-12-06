//
//  ImageUploader.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completetion: @escaping(String) -> Void)  {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, err in
            if let err = err {
                print("DEBUG: Failed to upload image with error \(err.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully uploaded image to firebase storage")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completetion(imageUrl)
            }
        }
    }
    
}
