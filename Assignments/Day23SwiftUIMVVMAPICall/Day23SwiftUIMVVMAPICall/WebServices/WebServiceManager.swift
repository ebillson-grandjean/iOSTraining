//
//  WebServiceManager.swift
//  Day23SwiftUIMVVMAPICall
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import Foundation


protocol WebServiceActions {
    func getDataFromWebService <T: Decodable> (url: URL, modelType: T.Type) async throws -> T
}


class WebServiceManager {
    
    var urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
}



extension WebServiceManager: WebServiceActions {
    
    func getDataFromWebService<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        do {
            let (data, response) = try await urlSession.data(from: url)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw WebServiceError.invalidResponse((response as? HTTPURLResponse)?.statusCode ?? 0)
            }
            
            let parsedData =  try JSONDecoder().decode(modelType, from: data)
            return parsedData
        }catch {
            throw error
        }
    }
}
