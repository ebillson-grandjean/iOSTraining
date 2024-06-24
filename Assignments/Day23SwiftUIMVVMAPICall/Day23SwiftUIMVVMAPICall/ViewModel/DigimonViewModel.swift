//
//  DigimonViewModel.swift
//  Day23SwiftUIMVVMAPICall
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import Foundation


class DigimonViewModel: ObservableObject {
    
    
    @Published var digimonArray = [Digimon]()
    @Published var customError: WebServiceError?
    @Published var hasErrorOccured = false
    var webServiceManager: WebServiceActions
    
    
    init(webServiceManager: WebServiceActions){
        self.webServiceManager = webServiceManager
    }
    
    
    @MainActor
    func getDigimonList(urlString: String) async {
        guard let url = URL(string: urlString) else {
            customError = WebServiceError.invalidURL
            hasErrorOccured = true
            return
        }
        
        do {
            digimonArray = try await self.webServiceManager.getDataFromWebService(url: url, modelType: [Digimon].self)
            print(digimonArray)
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
