//
//  StatusSelectorView.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import SwiftUI

struct StatusSelectorView: View {
    
    @ObservedObject var viewModel = StatusViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 1) {
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()
                    
                    // status cell
                    StatusCell(status: viewModel.status)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    // for loop with options
                    ForEach(UserStatus.allCases.filter({ $0 != .notConfigured }), id: \.self) { status in
                        Button { viewModel.updateStatus(status) } label: {
                            StatusCell(status: status)
                        }
                    }
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
        MainTabView()
    }
}

struct StatusCell: View {
    let status: UserStatus
    var body: some View {
        HStack {
            Text(status.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color.white)

    }
}
