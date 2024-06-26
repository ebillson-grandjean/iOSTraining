//
//  SchoolViewModel.swift
//  Assignment23SwiftUIMVVMSchool
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import Foundation
import Combine


protocol SchoolViewModelActions {
    func filterSchoolList(searchText: String)
}

class SchoolViewModel: ObservableObject {


    @Published var schoolArray = [School]()
    @Published var originalArray = [School]()
    @Published var customError: WebServiceError?
    @Published var hasErrorOccured = false
    
    var webServiceManager: WebServiceActions

    init(webServiceManager: WebServiceActions){
        self.webServiceManager = webServiceManager
    }



    @MainActor
    func getSchoolList(urlString: String) async {
        guard let url = URL(string: urlString) else {
            customError = WebServiceError.invalidURL
            hasErrorOccured = true
            return
        }

        guard let url = URL(string: urlString) else {
                    customError = WebServiceError.invalidURL
                    hasErrorOccured = true
                    return
                }
                
                do {
                    schoolArray = try await self.webServiceManager.getDataFromWebService(url: url, modelType: [School].self)
                    print(schoolArray)
                }catch {
                    hasErrorOccured = true
                    print(error.localizedDescription)
                    switch error {
                    case is DecodingError:
                        customError = WebServiceError.parsingError
                    case is URLError:
                        customError = WebServiceError.invalidURL
                    case WebServiceError.parsingError:
                        customError = WebServiceError.parsingError
                    case WebServiceError.invalidResponse(let code):
                        customError = WebServiceError.invalidResponse(code)
                    default:
                        customError = WebServiceError.noData
                    }
                    
                }
    }
}


extension SchoolViewModel: SchoolViewModelActions { // Open-close principle
    func filterSchoolList(searchText: String) {
        
        if searchText.isEmpty {
            schoolArray = self.originalArray
        } else {
            schoolArray = self.schoolArray.filter { school in
                return school.school_name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
}
