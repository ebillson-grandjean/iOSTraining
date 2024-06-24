//
//  BuilderPatternView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct BuilderPatternView: View {
    var body: some View {
        VStack {
            
            Text("Builder Pattern View")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 64)
            
            
            Button("Builder Pattern"){
               
                let user = UserBuilder().setEmail("email@mail.com")
                    .setPhone("12345678").buildUser()
                
                print(user.description())
                
            }
            .frame(width: 300, height: 40)
            .background(Color(.cyan))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.bottom, 8)
            
        }
    }
}

#Preview {
    BuilderPatternView()
}
