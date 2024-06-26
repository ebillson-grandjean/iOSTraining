//
//  FakeWebServiceManager.swift
//  Assignment23SwiftUIMVVMSchoolTests
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import Foundation
@testable import Assignment23SwiftUIMVVMSchool


class FakeWebServiceManager: WebServiceActions {
    
    func getDataFromWebService<T: Decodable>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: FakeWebServiceManager.self)
        
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        
        guard let url = url else {
            throw WebServiceError.invalidURL
        }
        
        do {
            let fileData = try Data(contentsOf: url)
            if fileData.isEmpty {
                throw WebServiceError.noData
            }
            let parsedList = try JSONDecoder().decode(modelType, from: fileData)
            print("=== DEBUG: parsedList ===")
            print(parsedList)
            return parsedList
        } catch {
            print("=== DEBUG: ERROR ===")
            throw error
        }
    }
    
    
}
