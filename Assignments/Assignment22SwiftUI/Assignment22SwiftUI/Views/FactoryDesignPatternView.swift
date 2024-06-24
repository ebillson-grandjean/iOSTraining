//
//  FactoryDesignPatternView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import SwiftUI

struct FactoryDesignPatternView: View {
    var body: some View {
        VStack {
            
            Text("Factory Design Pattern")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 64)
            
            
            
            Button("Create Basketball player"){
                
                let player = PlayerFactory()
                
                let pl = player.createPlayer(type: .basketball)
                pl.play()
                
            }
            .frame(width: 300, height: 40)
            .background(Color(.cyan))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.bottom, 8)
            
            
            Button("Create Soccer player"){
                let player = PlayerFactory()
                
                let pl = player.createPlayer(type: .soccer)
                pl.play()
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
    FactoryDesignPatternView()
}
