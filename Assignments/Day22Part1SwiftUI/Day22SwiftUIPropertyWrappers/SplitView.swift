//
//  SplitView.swift
//  Day22Part1SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import SwiftUI

struct SplitView: View {
    var usersSWE = ["Bill", "Bhushan", "John", "Jane", "Mary", "Sundar", "Mark", "Sylvia", "Lionel", "Fatima", "Gary", "Jennifer"]
    @State var selectedItem: String?
    
    var body: some View {
        NavigationSplitView {
            VStack {
                List(usersSWE, id: \.self, selection: $selectedItem) { month in

                    Text(month)
                    
                }
            }
        } detail: {
            if let selectedItem = selectedItem {
                DetailsView(data: selectedItem)
            }
        }
    }
}

#Preview {
    SplitView()
}
