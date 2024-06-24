//
//  GeometricReaderView.swift
//  Day22Part1SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import SwiftUI

struct GeometricReaderView: View {
    var body: some View {
        VStack {
            Text("Swift")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            
            GeometryReader { geometry in
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                    .overlay {
                        Text("Objective-C")
                            .foregroundStyle(.white)
                            .bold()
                            .padding()
                    }
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                
            }
            .background(.gray.opacity(0.2))
            .padding()
        }
    }
}

#Preview {
    GeometricReaderView()
}
