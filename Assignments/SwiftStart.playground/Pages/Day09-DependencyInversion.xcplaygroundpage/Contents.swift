//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

enum APIError:Error{
    case invalidUrl
    case requestFailed
    case httpError(code: Int)
    case unknown
}


protocol APIServiceProtocol {
    
    func fetchDataFromAPI(urlString: String, completionHandler: @escaping (Result<Data, APIError>) -> Void)
    
}


class DatabaseManager:APIServiceProtocol {
    func fetchDataFromAPI(urlString: String, completionHandler: @escaping (Result<Data, APIError>) -> Void){
        
    }

}

class FakeAPIManager: APIServiceProtocol {
    func fetchDataFromAPI(urlString: String, completionHandler: @escaping (Result<Data, APIError>) -> Void){
        
    }
}

class APIManager:APIServiceProtocol {
    
    
    func fetchDataFromAPI(urlString: String, completionHandler: @escaping (Result<Data, APIError>) -> Void){
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidUrl))
            return
        }
        
        print(url)
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            print("Inside Closure")
            
            if let error = error {
                completionHandler(.failure(.requestFailed))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode < 200 || response.statusCode > 299 {
                    completionHandler(.failure(.httpError(code: response.statusCode)))
                    return
                }
            }
            
            guard let data = data else {
                completionHandler(.failure(.unknown))
                return
            }
            completionHandler(.success(data))
        }
        dataTask.resume()
        print("End of API Call function")
    }

    
}


class ViewController {
    
    var apiManager: APIServiceProtocol

    init(apiManager:APIManager) {
        self.apiManager = apiManager
    }
    
    func doFirstAPICall(){
        self.apiManager?.fetchDataFromAPI(urlString: "abc"){ result in
            
            
        }
    }
    
    
    func doFirstAPICall(manager: APIManager){
        manager.fetchDataFromAPI(urlString: "abc"){ result in
            
            
        }
    }
}


//let v1 = ViewController(apiManager: APIManager()) // Constructor Injection

//let v2 = ViewController()
//v2.apiManager = APIManager() // prop injection

let v3 = ViewController()
v3.doFirstAPICall(manager: APIManager())

let v4 = ViewController(apiManager: APIManager()) // Inversion

let dbScreen = ViewController(apiManager: DatabaseManager())
dbScreen.doFirstAPICall()

let testScreen = ViewController(apiManager: FakeAPIManager())
testScreen.doFirstAPICall()
