//
//  NetworkError.swift
//  Day17MVVMClosure
//
//  Created by Ebillson Grand Jean on 6/14/24.
//

import Foundation

enum NetworkError: Error{
    case httpResponseError
    case badURL
    case noData
}


extension NetworkError: LocalizedError {
    
    let errorDescription: String?
    
    switch self {
    case .httpResponseError:
            return "HTTP Response Error"
    case .badURL:
            return "API Endpoint provided is invalid"
    case .noData:
            return "No data provided"
    }
    
}
