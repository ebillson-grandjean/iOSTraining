//
//  WebServiceError.swift
//  Assignment23SwiftUIMVVMSchool
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import Foundation


enum WebServiceError: Error {
    case invalidURL
    case invalidResponse(Int)
    case noData
    case parsingError
}


extension WebServiceError: LocalizedError, Equatable {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL Provided"
        case .invalidResponse(let statusCode):
            return "Invalid respons with status code \(statusCode)"
        case .noData:
            return "No data found"
        case .parsingError:
            return "Parsing Error"
        }
    }
}
