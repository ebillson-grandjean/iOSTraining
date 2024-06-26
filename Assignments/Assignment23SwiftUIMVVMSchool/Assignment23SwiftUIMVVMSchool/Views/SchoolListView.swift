//
//  SchoolListView.swift
//  Assignment23SwiftUIMVVMSchool
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

/*
 Combine: It's a framework developed by Apple for Reactive Programming
        It was released in iOS 13 onwards, basically from 2019
 
 Observer pattern / publisher subscriber pattern
 
 Reactive Programming: If X thing happens -> Y thing will automatically gets triggered
 3 major components:
    1- Publisher - Sending Data, it's a protocol, it will emit a series of values over time
    2- Subscriber - Receiving Data, it's also a protocol who will receive data sent by publisher
    3- Operator - Getting the data from publisher, changing it to the way subscriber needs it and then give it to subscriber and then gives it to the subscriber
    
    We can chain multiple operators at same point to publisher
 
 
 Advantages of using Combine:
    1- Your async code is more simplified
    2- Cancellation Support
    3- Declarative Syntax
    4- Multithreading support by itself
    5- Built-in memory management, no memory bags to carry
        Cancellable is acting as a memory bag
 
 3rd Party Frameworks
     RXSwift
     RXCocoa
     RXCocoaTouch
 
 RXSwift
    1. Schedulers
    2. Observables
    3. Operators
 */

import SwiftUI

struct SchoolListView: View {
    @StateObject var schoolViewModel  = SchoolViewModel(webServiceManager: WebServiceManager())
    @State var searchedText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
//                Button("Cancel"){
//                    schoolViewModel.cancelOnGoingRequest()
//                }
                List(schoolViewModel.schoolArray) { school in
                    NavigationLink(
                        destination: SchoolDetailsView(school: school),
                        label: {
                            SchoolItemView(school: school)
                        })
                    
                }
            }
            .task {
                await
                schoolViewModel.getSchoolList(urlString: APIConstants.baseURL + APIConstants.schoolsEndpoint)
            }
            .refreshable {
                await
                schoolViewModel.getSchoolList(urlString: APIConstants.baseURL + APIConstants.schoolsEndpoint)
            }
            .searchable(text: $searchedText)
            .onChange(of: searchedText, {
                schoolViewModel.filterSchoolList(searchText: searchedText)
                
            })
            .alert(isPresented: $schoolViewModel.hasErrorOccured) {
                      Alert(title: Text("Something Went Wrong!"),
                            message: Text(schoolViewModel.customError?.localizedDescription ?? ""),
                            dismissButton: .default(Text("Dismiss")))
                  }
            .navigationTitle("Schools")
            
        }
    }
}

#Preview {
    SchoolListView()
}
