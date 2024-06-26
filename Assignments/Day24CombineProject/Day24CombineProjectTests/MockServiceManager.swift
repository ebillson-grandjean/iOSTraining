//
//  MockServiceManager.swift
//  Day24CombineProjectTests
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import Foundation
@testable import Day24CombineProject
import Combine

class MockServiceManager: WebServiceActions {
    func getDataFromWebService<T>(url: URL, modelType: T.Type) -> AnyPublisher<T, any Error> where T : Decodable {
        let bundle = Bundle(for: MockServiceManager.self)
        
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        
        guard let url = url else {
            return Fail(error: WebServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        do {
            let fileData = try Data(contentsOf: url)
            if fileData.isEmpty {
               return Fail(error: WebServiceError.noData).eraseToAnyPublisher()
            }
            let parsedList = try JSONDecoder().decode(modelType, from: fileData)
            print("=== DEBUG: parsedList ===")
            print(parsedList)
            return Just(parsedList)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
                
        } catch {
            print("=== DEBUG: ERROR ===")
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    
    
}
