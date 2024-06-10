//: [Previous](@previous)

import Foundation
import UIKit

var greeting = "Hello, playground"

//: [Next](@next)

/*
 Dispatch Group = Is part of GCD Only, and it's used to manage a group of tasks or operations
 
 it allows us to wait for all multiple tasks to be completed and post that it will update about the status,
 it can notify
 Useful when you want to call a group of APIs
 
 */


func testDispatchGroup() {
    let group = DispatchGroup()
    
    group.enter()
    print("Task 1")
    group.leave()
    
    group.enter()
    print("Task 2")
    group.leave()
    
    
    group.notify(queue: .main){
        print("Update UI")
    }
}


testDispatchGroup()


func fetchDataFromAPI(url:URL, completion: @escaping (Result<Data, Error>) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
        
        if let data = data {
            completion(.success(data))
        }
    }
    
    task.resume()
}


// API Call

let apiURL1 = URL(string: "example.com/1")
let apiURL2 = URL(string: "example.com/2")
let apiURL3 = URL(string: "example.com/3")


let dispatchAPIGroup = DispatchGroup()


dispatchAPIGroup.enter()
fetchDataFromAPI(url: apiURL1!, completion: {result in
    print("Got API Response from 1")
})
dispatchAPIGroup.leave()


dispatchAPIGroup.enter()
fetchDataFromAPI(url: apiURL2!, completion: {result in
    print("Got API Response from 2")
})
dispatchAPIGroup.leave()


dispatchAPIGroup.enter()
fetchDataFromAPI(url: apiURL3!, completion: {result in
    print("Got API Response from 1")
})
dispatchAPIGroup.leave()

dispatchAPIGroup.notify(queue: .main) {
    print("Refresh UI after all API Calls")
}
