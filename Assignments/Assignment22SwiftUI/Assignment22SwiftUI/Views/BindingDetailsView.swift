//
//  BindingDetailsView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct BindingDetailsView: View {
    @Binding var phoneNumber: String
    
    var body: some View {
        Text("My phone number is: \(phoneNumber)")
        
        Button("Change phone number"){
            phoneNumber = "+1(423)-765-098"
        }
        .frame(width: 300, height: 40)
        .background(Color(.cyan))
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.bottom, 8)
        
    }
}

#Preview {
    BindingDetailsView(phoneNumber: .constant("00000"))
}
