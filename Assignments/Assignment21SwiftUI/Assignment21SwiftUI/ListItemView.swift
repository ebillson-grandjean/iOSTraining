//
//  ListItemView.swift
//  Assignment21SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import SwiftUI

struct ListItemView: View {
    
    var imageID: String
    var data: String
    
    var body: some View {
        HStack {
//            Image(systemName: "person.circle")
//                .resizable()
//                .scaledToFit()
//                .frame(width:72, height: 72)
//                .foregroundColor(.cyan)
            AsyncImage(url: URL(string: "https://reqres.in/img/faces/"+imageID+"-image.jpg")) {
                image in
                image
                
                
            } placeholder: {
                ProgressView()
                            Image(systemName: "person.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width:72, height: 72)
                                .foregroundColor(.cyan)
            }
            
            
            Text(data)
                .bold()
                .font(.title)
                .foregroundStyle(.cyan)
                .padding(.leading, 16)
        }
    }
}

#Preview {
    ListItemView(imageID: "1", data: "Name")
}
