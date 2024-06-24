//
//  ProductsViewModel.swift
//  Assignment19-MVVM
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import Foundation


class ProductViewModel: NSObject {
    
    let networkManager = NetworkManager()
    var products = [Product]()
    var refreshViewClosure: (()-> Void)?
    
    
    
    func getUsersDataWithProtocolDelegate(){
        
        guard let url = URL(string: APIConstants.ProductsEndpoint) else {
            print("Wrong URL")
            return
        }
    
        networkManager.delegate = self
        networkManager.getDataFromAPIUsingProtocolDelegate(url: url)
        
    }
}


extension ProductViewModel: DataTransferProtocol {
    
    func didReceiveData(productsResponse: ProductsResponse) {
        self.products = productsResponse.products
        refreshViewClosure?()
    }
    
    func didReceiveError(error: any Error) {
        print("INSIDE ERROR")
        print(error.localizedDescription)
    }
}
