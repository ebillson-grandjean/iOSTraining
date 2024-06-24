//
//  NetworkManager.swift
//  Assignment19-MVVM
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import Foundation


class NetworkManager {
    
    weak var delegate: DataTransferProtocol?
    
    func getDataFromAPIUsingProtocolDelegate(url: URL){
        
        let dataTask  = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                self.delegate?.didReceiveError(error: error)
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    self.delegate?.didReceiveError(error: NetworkError.httpResponseError(response.statusCode))
                    return
                }
            }
            
            
            guard let data = data else {
                self.delegate?.didReceiveError(error: NetworkError.dataNotFoundError)
                return
            }
            
            
            do {
                let parsedProductsData = try JSONDecoder().decode(ProductsResponse.self, from: data)
                print("PARSED DATA")
                print(parsedProductsData.products)
                self.delegate?.didReceiveData(productsResponse: parsedProductsData)
            }catch {
                print("AFTER TRYING TO PARSE PRODUCTS")
                self.delegate?.didReceiveError(error: error)
            }
            
        }
        
        dataTask.resume()
        
    }
    
    

}
