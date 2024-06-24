//
//  SignUpScreenView.swift
//  Assignment20SwiftLoginScreen
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import SwiftUI

struct SignUpScreenView: View {
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        VStack {
            
            Text("Hi!")
                .frame(maxWidth:.infinity, alignment: .leading)
                .font(.largeTitle)
                .bold()
                .padding(EdgeInsets(top: 48, leading: 24, bottom: 4, trailing: 24))
            
            Text("Create a new account")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
                .foregroundStyle(.gray)
                .padding(EdgeInsets(top: 4, leading: 24, bottom: 72, trailing: 24))
            
            TextField("Username", text: $username)
//                .textFieldStyle(.roundedBorder)
                .controlSize(.large)
                .padding(
                    EdgeInsets(top: 0,
                               leading: 24,
                               bottom: 0,
                               trailing: 24))
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 340, height: 1)
                .foregroundColor(.cyan)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 24,
                        bottom: 16,
                        trailing: 24)
                )
            
            
            TextField("Email", text: $email)
//                .textFieldStyle(.roundedBorder)
                .controlSize(.large)
                .padding(
                    EdgeInsets(top: 0,
                               leading: 24,
                               bottom: 0,
                               trailing: 24))
            
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 340, height: 1)
                .foregroundColor(.cyan)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 24,
                        bottom: 16,
                        trailing: 24)
                )
            
            
            SecureField("Password", text: $password)
//                .frame(width: 340, height: 60)
//                .textFieldStyle(.roundedBorder)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 24,
                        bottom: 0,
                        trailing: 24)
                )
            
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 340, height: 1)
                .foregroundColor(.cyan)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 24,
                        bottom: 48,
                        trailing: 24)
                )
            
            Button("SIGN UP"){}
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
            
            
            Button("Forgot Password?"){}
                .foregroundStyle(.cyan)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 24,
                        bottom: 8,
                        trailing: 24)
                )
            
            VStack {
                HStack{
                    /// Instead of image, use RoundedRectangle()
                    Image("HorizontalLine")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .background(Color(.white))
                        .foregroundColor(.white)
                    Text("or")
                        .bold()
                    Image("HorizontalLine")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .background(Color(.white))
                        .foregroundColor(.white)
                }
            }.padding(.bottom, 16)
            
            Text("Social Media Login")
                .foregroundStyle(.cyan)
                .padding(.bottom, 2)

            HStack {
                Image("GoogleLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .background(Color(.white))
                    .foregroundColor(.white)
                Image("FacebookLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .background(Color(.white))
                    .foregroundColor(.white)
                Image("AppleLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96, height: 96)
                    .background(Color(.white))
                    .foregroundColor(.white)
            }
            
            HStack {
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                Button("Sign in"){}
                    .foregroundStyle(.cyan)
                    .bold()
                    .padding(.bottom, 8)
            }
            
            
        }
    }
}

#Preview {
    SignUpScreenView()
}
