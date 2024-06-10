//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


func fetchData(url: String) async -> String {
    print("Inside fetchData Method")
    return "success"
}

Task {
    let result = await fetchData(url: "https://example.com") // Async
    print(result)
}

print("1")
print("2")



// creating a custom error

enum APIError:Error{
    case invalidUrl
    case requestFailed
    case httpError(code: Int)
    case unknown
}


func callFromAPI(url:URL) async throws -> Data {
    do {
        let (data, response ) = try await URLSession.shared.data(from: url)
        if let response = response as? HTTPURLResponse {
            if response.statusCode < 200 || response.statusCode > 299 {
                throw APIError.httpError(code: response.statusCode)
            }
        }
        
        return data
        
    }catch{
        throw error
    }
}



Task {
    do {
        let receivedData = try await callFromAPI(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        print("Received Data: \(receivedData)")
    }catch {
        switch error {
        case APIError.invalidUrl:
            print("Invalid Url")
        case APIError.requestFailed:
            print("Request Failed")
        case APIError.unknown:
            print("Unknown")
        case APIError.httpError(let code):
            print("http error with code: \(code)")
        default:
            print(error.localizedDescription)
        }
    }
}



// async let
// Api calls

let url1 = URL(string: "https://jsonplaceholder.typicode.com/users")
let url2 = URL(string: "https://jsonplaceholder.typicode.com/users")
let url3 = URL(string: "https://jsonplaceholder.typicode.com/users")

Task {
    do {
        async let data1 = callFromAPI(url: url1!)
        async let data2 = callFromAPI(url: url2!)
        async let data3 = callFromAPI(url: url3!)
        
        let result1 = try await data1
        let result2 = try await data2
        let result3 = try await data3
        
        
    }catch {
        print("Error")
        print(error.localizedDescription)
    }
}
