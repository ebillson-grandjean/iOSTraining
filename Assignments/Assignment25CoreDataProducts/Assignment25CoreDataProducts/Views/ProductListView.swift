//
//  ProductListView.swift
//  Assignment25CoreDataProducts
//
//  Created by Ebillson Grand Jean on 6/26/24.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var productViewModel  = ProductViewModel(webServiceManager: WebServiceManager())
    @State var searchedText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(productViewModel.productArray) { product in
                    NavigationLink(
                        destination: ProductDetailsView(product: product),
                        label: {
                            ProductItemView(product: product)
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
                await productViewModel.getProductList(urlString: APIConstants.baseURL + APIConstants.productsEndpoint)
            }
            .refreshable {
                await productViewModel.getProductList(urlString: APIConstants.baseURL + APIConstants.productsEndpoint)
            }
            .searchable(text: $searchedText)
            .alert(isPresented: $productViewModel.hasErrorOccured) {
                      Alert(title: Text("Something Went Wrong!"),
                            message: Text(productViewModel.customError?.localizedDescription ?? ""),
                            dismissButton: .default(Text("Dismiss")))
                  }
            .navigationTitle("Products")
            
        }
    }
}

#Preview {
    ProductListView()
}
