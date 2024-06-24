//
//  AdapterPatternView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct AdapterPatternView: View {
    var body: some View {
        VStack {
            
            Text("Adapter Pattern")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 64)
            
            
            
            Button("Adapter Patter"){
                let appleComputer = AppleComputer(hasConnector: true)
                let adapter = Adapter()
                
                adapter.connectTypeCToUSBAdapter(appleComputer: appleComputer)
                
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
    AdapterPatternView()
}
