//
//  ImageView.swift
//  Assignment21SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width:144, height: 144)
                .foregroundColor(.cyan)
            
            AsyncImage(url: URL(string: "https://reqres.in/img/faces/2-image.jpg")) {
                image in
                image
                
                
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    ImageView()
}
