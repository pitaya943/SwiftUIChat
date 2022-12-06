//
//  Extensions.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
