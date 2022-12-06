//
//  SettingsHeaderView.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {
    
    private let user: User
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
                
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
