//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Assignment-4
//Create a new playground taking any Example of your choice, to display the use of
//Below in Swift
//1.Initialisers in Swift
//2. Enums and its types
//3.Different uses of Enums and use of variables and functions inside Enum
//4.Struct vs classes document this in ur notes



//1.Initialisers in Swift

//Initialization is the process of preparing an instance of a class, structure, or enumeration for use. This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that’s required before the new instance is ready for use.
//
//You implement this initialization process by defining initializers, which are like special methods that can be called to create a new instance of a particular type.


struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit"

// Default Property Values

struct someStruct {
    
    var someDefaultProp = "Default Prop"
    
}


//Initialization Parameters

struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}


let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperatureInCelsius)
// boilingPointOfWater.temperatureInCelsius is 100.0

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius)
// freezingPointOfWater.temperatureInCelsius is 0.0

//2. Enums and its types

// 2 types of enum
// 1. RawValue enum
// 2. AssociatedType enum

enum CompassDirection {
    case north
    case east
    case south
    case west
}


//we define the direction on compass
let direction = CompassDirection.north
print(direction)

// Enums with Associated Values

enum Shape {
  case circle(radius: Double)
  case rectangle(width: Double, height: Double)
  case triangle(base: Double, height: Double)
}

func calculateArea(of shape: Shape) -> Double {
  switch shape {
  case let .circle(radius):
    return .pi * radius * radius
  case let .rectangle(width, height):
    return width * height
  case let .triangle(base, height):
    return 0.5 * base * height
  }
}

let circle = Shape.circle(radius: 2.0)
let rectangle = Shape.rectangle(width: 3.0, height: 4.0)
let triangle = Shape.triangle(base: 2.0, height: 3.0)

let circleArea = calculateArea(of: circle) // 12.566370614359172
let rectangleArea = calculateArea(of: rectangle) // 12.0
let triangleArea = calculateArea(of: triangle) // 3.0

print(circleArea)
print(rectangleArea)
print(triangleArea)

//3.Different uses of Enums and use of variables and functions inside Enum

// Error Handling
enum NetworkError: Error {
  case unknownError
  case invalidURL
  case networkError(Error)
  case serverError(Int)
  case authenticationError
}


//Handling API response status codes
enum HTTPStatusCode: Int {
    case ok = 200
    case created = 201
    case badRequest = 400
    case unauthorized = 401
    case notFound = 404
    case internalServerError = 500
}

func handleResponse(statusCode: HTTPStatusCode) {
    switch statusCode {
    case .ok, .created:
        print("Request was successful")
    case .badRequest:
        print("Bad request")
    case .unauthorized:
        print("Unauthorized access")
    case .notFound:
        print("Resource not found")
    case .internalServerError:
        print("Internal server error")
    }
}

let currentStatusCode: HTTPStatusCode = .ok
handleResponse(statusCode: currentStatusCode)


// Representing user roles in an authentication system
enum UserRole {
    case guest
    case member
    case admin
}

func checkPermissions(for role: UserRole) {
    switch role {
    case .guest:
        print("Guests have limited access to the system.")
    case .member:
        print("Members have access to most features.")
    case .admin:
        print("Admins have full access to the system.")
    }
}

let currentUserRole: UserRole = .member
checkPermissions(for: currentUserRole)

//4.Struct vs classes document this in ur notes
//Struct vs Classes
//
//1. Classes support inheritance, Struct doesn't
//2. Classes are reference types
//3. Structs are value types
//4. Classes get stored on heap memory, structs get stored on stack memory
//5. Classes share memory location, struct doesn't
//6. Structs are immutable by default
//7. Classes need initializers whereas Structs came with built-in initializers called as members initializer
//8. Structs are faster compared to classes



