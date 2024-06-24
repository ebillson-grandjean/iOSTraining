//
//  SingletonPatternView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import SwiftUI

struct SingletonPatternView: View {
    
    
    var body: some View {
        
        VStack {
            
            Text("Singleton Pattern")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 64)
            
            
            
            Button("Set IP"){
                
                IPManager.sharedIP.setIPAddress(address: "192.168.1.1")
                
                print(IPManager.sharedIP.IPAddress)
                
            }
            .frame(width: 300, height: 40)
            .background(Color(.cyan))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.bottom, 8)
            
            
            Button("Default IP"){
                IPManager.sharedIP.setDefaultIP()
                print(IPManager.sharedIP.IPAddress)
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
    SingletonPatternView()
}
