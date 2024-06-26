//
//  WebServiceManager.swift
//  Assignment23SwiftUIMVVMSchool
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import Foundation
import Combine

 protocol WebServiceActions {
     func getDataFromWebService <T: Decodable> (url: URL, modelType: T.Type) -> AnyPublisher<T, Error>
 }


 class WebServiceManager {

     var urlSession: URLSession

     init(urlSession: URLSession = URLSession.shared) {
         self.urlSession = urlSession
     }

 }



 extension WebServiceManager: WebServiceActions {
     
     func getDataFromWebService<T: Decodable>(url: URL, modelType: T.Type) -> AnyPublisher<T, Error> {


         return self.urlSession.dataTaskPublisher(for: url)
             .map{$0.data} // {data, response}
             .decode(type: modelType, decoder: JSONDecoder()) // parsing
             .eraseToAnyPublisher()

     }
 }

