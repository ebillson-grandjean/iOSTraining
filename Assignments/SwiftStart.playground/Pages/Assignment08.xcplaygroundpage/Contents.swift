//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


//Assignment-8
/*
 
 Create new playground taking any example of your choice, so as to display the use of below in Swift:
 1.AssociatedType
 2.Error handling in iOS
 3.Dependency Injections
 
 Prepare Theoretical part for above topics as well, We will have question answer session for it.
 */



//1.AssociatedType

protocol Stack {
    
    associatedtype Element
    
    mutating func push(_ element:Element)
    mutating func pop() -> Element?
}


struct GenericStackInt:Stack{
    
    typealias Element = Int
    private var items:[Element] = []
    
    
    mutating func push(_ element: Element){
        items.append(element)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
    
}


var stackOfInts = GenericStackInt()
stackOfInts.push(1)
stackOfInts.push(3)
stackOfInts.push(4)
stackOfInts.push(9)
stackOfInts.push(10)
stackOfInts.push(11)

print(stackOfInts)

stackOfInts.pop()

print(stackOfInts)


struct GenericStackString:Stack {
    
    typealias Element = String
    var items: [Element] = []
    
    mutating func push(_ element: String) {
        items.append(element)
    }
    
    mutating func pop() -> String? {
        items.popLast()
    }
    
}

var stackOfStrings = GenericStackString()

stackOfStrings.push("Ebillson")
stackOfStrings.push("Bill")
stackOfStrings.push("Ebill")

print(stackOfStrings)

stackOfStrings.pop()

print(stackOfStrings)


//2.Error handling in iOS
enum NetworkError:Error {
    case noInternet
    case invalidURL
    case serverError
}


func checkInternetConnection () -> Bool {
    // do some check
    // returns the result of the check
    return true
}


func checkIfServerIsOperational () -> Bool {
    // do some check
    // returns result of the check
    return false
}

func createRequest(from url: String) throws -> String{
    
    let isThereInternet = checkInternetConnection()
    let isServerOperational = checkIfServerIsOperational()
    
    if !isThereInternet {
        throw NetworkError.noInternet
    }
    
    if(url != "https://someurl.com"){
        throw NetworkError.invalidURL
    }
    
    if(!isServerOperational) {
        throw NetworkError.serverError
    }
    
    return "Request was created successfully"
}

// I think it froze up again

do {
    let request = try createRequest(from: "https://someurl.com")
//    let request = try createRequest(from: "https://someurl.com")
//    let request = try createRequest(from: "https://someurl.com")
    print(request)
}catch{
    switch error {
    case NetworkError.invalidURL:
        print("The Url provided is invalid")
    case NetworkError.noInternet:
        print("Please make sure you have a stable internet connection")
    case NetworkError.serverError:
        print("Oops! We ran into a server error!")
    default:
        print("Couldn't process your request")
    }
}


//3.Dependency Injections

// Constructor/Initializer Injection
protocol UserServiceProtocol {
    func fetchUsers() -> [String]
}


protocol OrderServiceProtocol {
    func fetchOrders() -> [String]
}


class UserService:UserServiceProtocol {
    func fetchUsers() -> [String]{
        return ["Ebillson", "John", "Jack"]
    }
}


class OrderService:OrderServiceProtocol {
    func fetchOrders() -> [String] {
        return ["Apple", "Banana", "Lemon"]
    }
}




class ViewModel {
    private let userService: UserService
    private let orderService: OrderServiceProtocol // Dependency Inversion
    
    
    // Initializer Injection
    init(userService: UserService, orderService: OrderService) {
        self.userService = userService
        self.orderService = orderService
    }
    
    func getOrders() -> [String] {
        self.orderService.fetchOrders()
    }
}


// Setter Injection / Property Injection
class OtherViewModel {
    
    private var userService: UserServiceProtocol?
    private var orderService: OrderServiceProtocol?
    
    func setUserService(userService:UserServiceProtocol){ // Setter injection
        self.userService = userService
    }
    
    func setOrderService(orderService:OrderServiceProtocol){
        self.orderService = orderService
    }
    
    func getOrders() -> [String] {
        return self.orderService!.fetchOrders()
    }
}


// Method Injection

class AnotherViewModel {
    
    func getUsers(userService:UserServiceProtocol) -> [String]{
        return userService.fetchUsers()
    }
}


// Examples

// Init Injection
var initInj = ViewModel(userService: UserService(), orderService: OrderService())
print(initInj.getOrders())


// Setter Injection

var setterInj = OtherViewModel()

var orderService = OrderService()

setterInj.setOrderService(orderService: orderService)

print(setterInj.getOrders())


// Method Injection
var methodInj = AnotherViewModel()

let mInjUserService = UserService()

print(methodInj.getUsers(userService: mInjUserService))
