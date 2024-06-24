//
//  ObserverPatternView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct ObserverPatternView: View {
    var body: some View {
        
        let myPublisher = MyPublisher()
        
        VStack {
            

            
            Text("Observer Pattern")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 64)
            
            
            
            Button("Observer Pattern"){
                myPublisher.observe()
                myPublisher.startDownloading()
                
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
    ObserverPatternView()
}
