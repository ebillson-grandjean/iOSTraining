//
//  GridItemView.swift
//  Assignment21SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import SwiftUI

struct GridItemView: View {
    var data: String

    var body: some View {

        RoundedRectangle(cornerRadius: 20)
            .fill(.cyan)
            .overlay{
                
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width:72, height: 72)
                        .foregroundColor(.white)
                    Text(data)
                        .bold()
                        .font(.title)
                        .foregroundStyle(.white)
                }
                
            }
    }
}

#Preview {
    GridItemView(data: "Name")
}
