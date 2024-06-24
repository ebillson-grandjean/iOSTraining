//
//  StateDetailsView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct StateDetailsView: View {
    let data: String
    
    var body: some View {
        Text("The user on this screen is: ")
        Text(data)
        
        
    }
}

#Preview {
    StateDetailsView(data: "Default User")
}
