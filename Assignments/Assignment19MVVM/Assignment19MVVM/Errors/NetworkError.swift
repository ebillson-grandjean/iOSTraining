//
//  NetworkError.swift
//  Assignment19-MVVM
//
//  Created by Ebillson Grand Jean on 6/19/24.
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
