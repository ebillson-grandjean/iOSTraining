//
//  HomeView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("smallLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth:136,
                            maxHeight: 136,
                            alignment: .leading)
                        .background(Color(.white))
                        .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
                
                Image("MainLogoApp")
                    .resizable()
                    .scaledToFit()
                    .frame(width:250, height: 250)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .position(x: 190, y: 100)
                    .background(Color(.white))
                    .foregroundColor(.white)
                
                
                
                Text("Hello!")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 2)
                
                Text("Best place to write your stories and share your journey experiences")
                    .font(.title2)
                
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 24, leading: 28, bottom: 64, trailing: 28))
                
                
                NavigationLink("LOGIN"){
                    LoginView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .cornerRadius(8) /// make the background rounded
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(.cyan, lineWidth: 0)
                )
                .padding(.bottom, 16)
                
                
                NavigationLink("SIGN UP"){
                    SignUpView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.white))
                .foregroundColor(.cyan)
                .cornerRadius(8) /// make the background rounded
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 8)
                            .stroke(.cyan, lineWidth: 1))
                .padding(.bottom, 16)
                
                
            }
        }
    }
}

#Preview {
    HomeView()
}
