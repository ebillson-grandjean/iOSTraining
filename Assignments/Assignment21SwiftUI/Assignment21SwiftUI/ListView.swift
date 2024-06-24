//
//  ListView.swift
//  Assignment21SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import SwiftUI

struct ListView: View {
    
    var usersSWE = ["Bill", "Bhushan", "John", "Jane", "Mary", "Sundar", "Mark", "Sylvia", "Lionel", "Fatima", "Gary", "Jennifer"]
    
    var usersHR = ["Daniel", "Aniston", "Hugo", "Georges", "Dana", "Irvana", "Madison", "Vera", "Williams", "Dwayne", "Ariana", "Carl"]
    
    var body: some View {
        List{
            Section("SWE Team"){
                
                ForEach(Array(usersSWE.enumerated()), id: \.offset) { index , user in
//                    NavigationLink(LocalizedStringKey, destination: <#T##() -> Destination#>){}
                    ListItemView(imageID: String(index + 1), data: user)
                        .onTapGesture {
                            print(user)
                        }
                }
            }
            .font(.largeTitle)
            .bold()
            
            
            Section("HR Team"){
                ForEach(Array(usersHR.enumerated()), id: \.offset) { index, user in
                    ListItemView(imageID: String(index + 1), data: user)
                        .onTapGesture {
                            print(user)
                        }
                }
            }
            .font(.largeTitle)
            .bold()
            
        }
    }
    
    
//    List(users, id:\.self){ user in
//        ListItemView(data: user)
//            .onTapGesture {
//                print(user)
//            }
//    }
}

#Preview {
    ListView()
}
