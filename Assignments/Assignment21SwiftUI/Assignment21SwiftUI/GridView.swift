//
//  GridView.swift
//  Assignment21SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import SwiftUI

struct GridView: View {
    var usersSWE = ["Bill", "Bhushan", "John", "Jane", "Mary", "Sundar", "Mark", "Sylvia", "Lionel", "Fatima", "Gary", "Jennifer", "Antonio", "Josep", "Lucianna"]
    
    var usersHR = ["Daniel", "Aniston", "Hugo", "Georges", "Dana", "Irvana", "Madison", "Vera", "Williams", "Dwayne", "Ariana", "Carl"]
    
    private var gridColumn = [GridItem(), GridItem(), GridItem()]
    private var gridRow = [GridItem(), GridItem()]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumn) {
                    Section("SWE Team"){
                        ForEach(usersSWE, id:\.self){ user in
                            GridItemView(data: user)
                                .frame(width: 128, height: 128)
                                .onTapGesture {
                                    print(user)
                                }
                        }
                    }
                    .font(.largeTitle)
                    .bold()
                }
            }.padding(.bottom, 4)
            
           
            ScrollView(.horizontal){
                LazyHGrid(rows: gridRow) {
//                    Section("SWE Team"){
                        ForEach(usersSWE, id:\.self){ user in
                            GridItemView(data: user)
                                .frame(width: 184, height: 184)
                                .onTapGesture {
                                    print(user)
                                }
                        }
//                    }
                    .font(.largeTitle)
                    .bold()
                }
            }
        }
    }
}



//Grid {
//    Section("SWE Team"){
//        ForEach(usersSWE, id:\.self){ user in
//            GridItemView(data: user)
//                .frame(width: 160, height: 160)
//                .onTapGesture {
//                    print(user)
//                }
//        }
//    }
//    .font(.largeTitle)
//    .bold()
//}

#Preview {
    GridView()
}
