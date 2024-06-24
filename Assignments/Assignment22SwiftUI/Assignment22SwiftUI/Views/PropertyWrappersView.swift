//
//  PropertyWrappersView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct PropertyWrappersView: View {
    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Property Wrappers")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 64)
                
                NavigationLink("State"){
                    StateView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
                
                
                NavigationLink("Binding"){
                    BindingView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
                
            }
            .padding()
        }
    }
}

#Preview {
    PropertyWrappersView()
}
