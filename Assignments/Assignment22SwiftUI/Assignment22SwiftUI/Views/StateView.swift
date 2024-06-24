//
//  StateView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct StateView: View {
    
    var users = ["User 1", "User 2", "User 2", "User 3", "User 4", "User 5", "User 6", "User 7", "User 8", "User 9", "User 10", "User 11", "User 12", "User 13", "User 14", "User 15"]
    
    @State var selectedItem: String?
    
    var body: some View {
        NavigationSplitView {
            
            VStack{
                
                Text("Users")
                    .font(.title)
                List(users, id:\.self, selection:$selectedItem){
                    user in
                    Text(user)
                }
            }
        } detail: {
            if let selectedItem = selectedItem {
                StateDetailsView(data: selectedItem)
            }
        }
    }
}

#Preview {
    StateView()
}
