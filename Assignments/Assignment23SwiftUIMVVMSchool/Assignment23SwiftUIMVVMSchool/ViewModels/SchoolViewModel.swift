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
    var cancellable = Set<AnyCancellable>()


    init(webServiceManager: WebServiceActions){
        self.webServiceManager = webServiceManager
    }



//    @MainActor
    func getSchoolList(urlString: String) async {
        guard let url = URL(string: urlString) else {
            customError = WebServiceError.invalidURL
            hasErrorOccured = true
            return
        }

        self.webServiceManager.getDataFromWebService(url: url, modelType: [School].self)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    self.hasErrorOccured = true
                    switch error {
                        case is DecodingError:
                            self.customError = WebServiceError.parsingError
                        case is URLError:
                            self.customError = WebServiceError.invalidURL
                        case WebServiceError.parsingError:
                            self.customError = WebServiceError.parsingError
                        case WebServiceError.invalidResponse(let code):
                            self.customError = WebServiceError.invalidResponse(code)
                        default:
                            self.customError = WebServiceError.noData
                    }
                }

            } receiveValue: { list in
                self.schoolArray = list.sorted(by: {$0.school_name < $1.school_name})
                self.originalArray = self.schoolArray
            }.store(in: &cancellable)
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
