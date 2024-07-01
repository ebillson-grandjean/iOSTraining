//
//  NetworkManager.swift
//  Day26MVVMWalmartCountries
//
//  Created by Ebillson Grand Jean on 6/27/24.
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
                let parsedCountriesData = try JSONDecoder().decode([Country].self, from: data)
                print("PARSED DATA")
                print(parsedCountriesData)
                self.delegate?.didReceiveData(countries: parsedCountriesData)
            }catch {
                print("AFTER TRYING TO PARSE PRODUCTS")
                self.delegate?.didReceiveError(error: error)
            }
            
        }
        
        dataTask.resume()
        
    }
}
