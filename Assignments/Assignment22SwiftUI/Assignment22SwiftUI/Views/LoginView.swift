//
//  LoginView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
//    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            
            Text("Welcome!")
                .frame(maxWidth:.infinity, alignment: .leading)
                .font(.largeTitle)
                .bold()
                .padding(EdgeInsets(top: 48, leading: 24, bottom: 4, trailing: 24))
            
            Text("Sign In to continue")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
                .foregroundStyle(.gray)
                .padding(EdgeInsets(top: 4, leading: 24, bottom: 72, trailing: 24))
            
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
            
            
//            NavigationLink("LOGIN", destination: chooseDestination())
            NavigationLink("LOGIN"){
                MenuView()
            }
//            {
//                if(loginViewModel.areCredentialsValid(email: email, password: email)){
//                    print("Correct Credentials!")
//                }else{
//                    print("Incorrect Credentials!")
//                }
//            }
//            .alert(isPresented: $loginViewModel.areCredentialsValid) {
//                      Alert(title: Text("Something Went Wrong!"),
//                            message: Text("Invalid Credentials!"),
//                            dismissButton: .default(Text("Dismiss")))
//            }
            .frame(width: 300, height: 40)
            .background(Color(.cyan))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.bottom, 8)
            
            NavigationLink("Forgot Password?"){}
            .foregroundStyle(.cyan)
            .padding(.bottom, 8)
            
            VStack {
                HStack{
                    RoundedRectangle(cornerRadius: 2)
                        .frame( height: 1)
                        .foregroundColor(.black)
                        .padding(
                            EdgeInsets(
                                top: 0,
                                leading: 24,
                                bottom: 16,
                                trailing: 24)
                        )
                    Text("or")
                        .bold()
                    RoundedRectangle(cornerRadius: 2)
                        .frame( height: 1)
                        .foregroundColor(.black)
                        .padding(
                            EdgeInsets(
                                top: 0,
                                leading: 24,
                                bottom: 16,
                                trailing: 24)
                        )
                }
            }.padding(.bottom, 16)
            
            Text("Social Media Login")
                .foregroundStyle(.cyan)
                .padding(.bottom, 8)

            HStack {
                Image("GoogleLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .background(Color(.white))
                    .foregroundColor(.white)
                Image("FacebookLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 76, height: 76)
                    .background(Color(.white))
                    .foregroundColor(.white)
                Image("AppleLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .background(Color(.white))
                    .foregroundColor(.white)
            }
            
            HStack {
                Text("Don't have an account?")
                    .foregroundStyle(.gray)
                    .padding(.bottom, 8)
                NavigationLink("Sign up"){
                    SignUpView()
                }
                .foregroundStyle(.cyan)
                .bold()
                .padding(.bottom, 8)
            }
        }
    }
    
    
//    @ViewBuilder
//    func chooseDestination() -> some View {
//        if loginViewModel.areCredentialsValid(email: email, password: password) {
//            MenuView()
//        }else{
//            LoginView()
//        }
//    }
}

#Preview {
    LoginView()
}
