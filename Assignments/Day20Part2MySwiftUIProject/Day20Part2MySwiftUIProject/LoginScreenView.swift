//
//  LoginScreenView.swift
//  Day20Part2MySwiftUIProject
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import SwiftUI

struct LoginScreenView: View {
    @State var emailID:  String = ""
    @State var password: String = ""
    var developerName: String = "Ebillson"
    
    var body: some View {
        
        VStack {
            
            Text("Welcome to my App!")
                .font(.title)
                .foregroundStyle(.cyan)
            
            
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LoginScreenView()
}
