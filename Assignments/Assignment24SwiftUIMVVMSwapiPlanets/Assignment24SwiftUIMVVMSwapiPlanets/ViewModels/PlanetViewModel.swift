//
//  PlanetViewModel.swift
//  Assignment24SwiftUIMVVMSwapiPlanets
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import Foundation
import Combine


protocol PlanetViewModelActions {
    func filterPlanetList(searchText: String)
}

class PlanetViewModel: ObservableObject {


    @Published var planetArray = [Planet]()
    @Published var planetOriginalArray = [Planet]()
    @Published var customError: WebServiceError?
    @Published var hasErrorOccured = false
    
    var webServiceManager: WebServiceActions
    var cancellable = Set<AnyCancellable>()

    init(webServiceManager: WebServiceActions){
        self.webServiceManager = webServiceManager
    }

    func cancelOnGoingRequest(){
        cancellable.first?.cancel()
    }

//    @MainActor
    func getPlanetList(urlString: String) {
        guard let url = URL(string: urlString) else {
            customError = WebServiceError.invalidURL
            hasErrorOccured = true
            return
        }

        self.webServiceManager.getDataFromWebService(url: url, modelType: PlanetData.self)
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
                self.planetArray = list.results.sorted(by: {$0.name < $1.name})
                self.planetOriginalArray = self.planetArray
            }.store(in: &cancellable)
    }
}


extension PlanetViewModel: PlanetViewModelActions { // Open-close principle
    func filterPlanetList(searchText: String) {
        
        if searchText.isEmpty {
            planetArray = self.planetOriginalArray
        } else {
            planetArray = self.planetArray.filter { planet in
                return planet.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
}
