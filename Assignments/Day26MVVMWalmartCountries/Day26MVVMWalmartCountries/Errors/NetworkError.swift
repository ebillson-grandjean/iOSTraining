//
//  NetworkErrors.swift
//  Day26MVVMWalmartCountries
//
//  Created by Ebillson Grand Jean on 6/27/24.
//

import Foundation


enum NetworkError:Error {
    
    case httpResponseError(Int)
    case badURLError
    case dataNotFoundError
}

extension NetworkError:LocalizedError {
    
    var errorDescription: String? {
        
        switch self {
        case .httpResponseError:
            return "Bad status code"
        case .badURLError:
            return "URL provided is invalid"
        case .dataNotFoundError:
            return "No data received"
        }
    }
}
