//
//  FacadeDesignPatternView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct FacadeDesignPatternView: View {
    var body: some View {
        VStack {
            
            Text("Facade Design Pattern")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 64)
            
            
            
            Button("Computer Facade"){
                
                let computerFacade = ComputerFacade()
                
                computerFacade.start()
                
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
    FacadeDesignPatternView()
}
