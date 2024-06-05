//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


//Assignment-9
/* Create new playground taking any example of your choice, so as to display the use of below in Swift:
 
 1.Dependency Inversion
 2.Example API call with using Result Type using escaping closure and do error handling  dummy url for api-  https://jsonplaceholder.typicode.com/users
 Note- Complete all pending assignments also prepare for topics for coding and tech answers for SME evaluation for shared topics
 */



//1. Dependency Inversion
protocol UserServiceProtocol {
    func fetchUsers() -> [String]
}


protocol OrderServiceProtocol {
    func fetchOrders() -> [String]
}


class UserService:UserServiceProtocol {
    func fetchUsers() -> [String] {
        return ["User1", "USer2", "User3"]
    }
}


class OrderService:OrderServiceProtocol {
    func fetchOrders() -> [String] {
        return ["Order1", "Order2", "Order3"]
    }
}


class ViewModel {
    
    var userService:UserService
    var orderService:OrderServiceProtocol // Dependency inversion
    
    init(userService: UserService, orderService: OrderServiceProtocol) {
        self.userService = userService
        self.orderService = orderService
    }
    
    func getUsers() -> [String]{
        return self.userService.fetchUsers()
    }
    
    func getOroders() -> [String]{
        return self.orderService.fetchOrders()
    }
}


var vmDepInversion = ViewModel(userService: UserService(), orderService: OrderService()) // Dependency Inversion

// Printing users
print(vmDepInversion.getUsers())
// Printing orders
print(vmDepInversion.getOroders())






//2. 2.Example API call with using Result Type using escaping closure and do error handling  dummy url for api-  https://jsonplaceholder.typicode.com/users

enum APIError:Error {
    
    case invalidUrl
    case requestFailed
    case httpError(code: Int)
    case unknown
}


func fetchDataFromAPI(url: String, completionHandler: @escaping (Result<Data, APIError>) -> Void) {
    // checking if url is invalid
    guard let url = URL(string: url) else {
        completionHandler(.failure(.invalidUrl))
        return
    }
    
    print("URL: \(url)")
    
    
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
        
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
}


fetchDataFromAPI(url: "https://jsonplaceholder.typicode.com/users") { result in
    
    switch result {
        
    case .success(let receivedData):
        print(receivedData)
    case .failure(let error):
        print(error.localizedDescription)
    }
}
