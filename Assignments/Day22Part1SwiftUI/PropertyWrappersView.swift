//
//  PropertyWrappersView.swift
//  Day22Part1SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import SwiftUI

struct PropertyWrappersView: View {
    
    @Binding var data: String
    
    var body: some View {
        Text(data)
        Button("Button"){
            data = "{Some data is returned to the first Screen from the second screen yay!!!}"
        }
    }
}

#Preview {
    PropertyWrappersView(data: .constant("PropertyWrapper"))
}
