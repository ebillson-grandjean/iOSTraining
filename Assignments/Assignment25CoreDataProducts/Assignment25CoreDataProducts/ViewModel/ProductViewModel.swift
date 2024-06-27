//
//  ProductViewModel.swift
//  Assignment25CoreDataProducts
//
//  Created by Ebillson Grand Jean on 6/26/24.
//

import Foundation


class ProductViewModel: ObservableObject {
    
    
    @Published var productArray = [Product]()
    @Published var customError: WebServiceError?
    @Published var hasErrorOccured = false
    var webServiceManager: WebServiceActions
    
    
    init(webServiceManager: WebServiceActions){
        self.webServiceManager = webServiceManager
    }
    
    
    @MainActor
    func getProductList(urlString: String) async {
        guard let url = URL(string: urlString) else {
            customError = WebServiceError.invalidURL
            hasErrorOccured = true
            return
        }
        
        do {
            let productList = try await self.webServiceManager.getDataFromWebService(url: url, modelType: ProductData.self)
            NumberFormatter()
            print("productArray")
            productArray = productList.products
            print(productArray)
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
