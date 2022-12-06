//
//  LoginView.swift
//  SwiftUIChat
//
//  Created by 阿揆 on 2022/12/6.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack { Spacer() }
                    Group {
                        Text("Hello.")
                        Text("Welcome Back")
                            .foregroundColor(.blue)
                    }
                    .font(.largeTitle)
                    .bold()
                    
                    VStack(spacing: 40) {
                        CustomTextField(imageName: "envelope", placeholderText: "Email", isSecureField: false, text: $email)
                        
                        CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                        
                    }
                    .padding([.top, .horizontal], 32)
                }
                .padding(.leading)
                
                HStack {
                    Spacer()
                    NavigationLink {
                        Text("Reset Password..")
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 28)
                    }

                }
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)

                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 14))
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
                .padding(.bottom, 32)
            }
        }
        .padding(.top, -56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
