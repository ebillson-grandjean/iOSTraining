//
//  BindingView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct BindingView: View {
    
    @State var phoneNumber = "+1(234)-456-789"
    
    var body: some View {
        Text("Binding")
            .font(.largeTitle)
            .bold()
            .multilineTextAlignment(.center)
            .padding(.bottom, 64)
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("My phone is \(phoneNumber)")
        
        NavigationLink("Binding Details View"){
            BindingDetailsView(phoneNumber: $phoneNumber)
        }
        .frame(width: 300, height: 40)
        .background(Color(.cyan))
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.bottom, 8)
    }
}

#Preview {
    BindingView(phoneNumber: "+1(000)-000-000")
}
