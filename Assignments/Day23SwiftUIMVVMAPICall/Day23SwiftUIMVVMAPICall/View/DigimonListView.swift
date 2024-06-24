//
//  DigimonListView.swift
//  Day23SwiftUIMVVMAPICall
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct DigimonListView: View {
    @StateObject var digimonViewModel  = DigimonViewModel(webServiceManager: WebServiceManager())
    @State var searchedText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(digimonViewModel.digimonArray) { digimon in
                    NavigationLink(
                        destination: DigimonDetailView(digimon: digimon),
                        label: {
                            DigimonItemView(digimon: digimon)
                        })
                    
                }
            }
            //        .onAppear{
            //            Task{
            //                await digimonViewModel.getDigimonList(urlString: APIConstants.baseURL + APIConstants.digimonEndpoint)
            //            }
            //        }
            //        
            .task {
                await digimonViewModel.getDigimonList(urlString: APIConstants.baseURL + APIConstants.digimonEndpoint)
            }
            .refreshable {
                await digimonViewModel.getDigimonList(urlString: APIConstants.baseURL + APIConstants.digimonEndpoint)
            }
            .searchable(text: $searchedText)
            .alert(isPresented: $digimonViewModel.hasErrorOccured) {
                      Alert(title: Text("Something Went Wrong!"),
                            message: Text(digimonViewModel.customError?.localizedDescription ?? ""),
                            dismissButton: .default(Text("Dismiss")))
                  }
            .navigationTitle("Digimon")
            
        }
    }
}

#Preview {
    DigimonListView()
}
