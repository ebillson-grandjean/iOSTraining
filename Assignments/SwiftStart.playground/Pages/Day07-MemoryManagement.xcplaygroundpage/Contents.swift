//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


/*
 
 Memory Types
 
 1- Stack Memory (LIFO) : structs, enums, tuples, strings, all value types
 It is used for storing all local variables or parameters to functions, return types
 Data allocated on stack is automatically deallocated when usage is done by compiler it self
 Stack memory is a fixed size memory
 
 2- Heap Memory: Classes, Closures, Actor
 Heap memory is allocated during runtime
 objects like views, Array of objects, complex datas will be saved
 ARC - Automatic Reference Counting
 
 strong - default, every object gets created as strong by default.
          This means we want to take ownership of this object.
          This one increases the reference count by 1
 
 weak - doesn't take ownership of that object and doesn't increase the reference count
 
 unowned - is similar to weak, but unowned can't be optional and also it needs to always have a value.
           If not it will crash your code
 
 */


class Person {
    
    var name: String
    var age: Int
    var vehicle: Car?
    
    init(name: String, age: Int, vehicle: Car? = nil) {
        self.name = name
        self.age = age
        self.vehicle = vehicle
        print("init for Person")
    }
    
    
    deinit {
        print("deinit for Person")
    }
}


class Car {
    
    var type:String
    var brand: String
    var owner: Person?
    
    
    init(type: String, brand: String, owner: Person?) {
        self.type = type
        self.brand = brand
        self.owner = owner
        print("init for Car")
    }
    
    deinit {
        print("deinit for Car")
    }
}


// reference counting = 0
//var p1: Person? = Person(name: "Bill", age: 27, vehicle: nil) // reference count = 0 + 1


//weak var p2 = p1 // 1 + 1 = 2
//unowned var p2 = p1 // 1 + 1 = 2

//p2?.name = "Bob"

//print(p1?.name)
//print(p2?.name)

//p1 = nil // 2 - 1 = 1
//p2 = nil // 1 - 1 = 0

//print(p2?.name)



// Retain Cycle



var p1: Person? = Person(name: "Alex", age: 30, vehicle: nil)
var c1: Car? = Car(type: "Electric", brand: "Tesla", owner: p1)
p1?.vehicle = c1



class Airport {
    
    var name: String
    var someID: Int
    
    
    init(name: String, someID: Int) {
        self.name = name
        self.someID = someID
    }
    
}

// retain count = 0
var airport1: Airport? = Airport(name: "ATL", someID: 1) // 0 + 1 = 1 => increment by 1
airport1 = nil // 1 - 1 = 0 // decrement by 1

// when retain count = 0 => ARC frees memory

//0
var nycAirport:Airport? = Airport(name: "NYC", someID: 2) // 0 + 1 = 1
var denverAirport = nycAirport // 1 + 1 = 2

// if denverAirport is declared as =>
//weak denverAirport = nycAirport => no increment => 1 = 1

// if denverAirport is declared as =>
// unowned denverAirport = nycAirport
// when it is set to nil and when trying to access a property like denverAirport.name, a crash is gonna occur
// if the var is not unowned since the var is optional, there will have no crash
// See below example in line after nil

nycAirport = nil // 2 - 1 = 1
denverAirport = nil // 1 - 1 = 0

// retain count = 0 => memory freed
// when it is set to nil and when trying to access a property like denverAirport.name, a crash is gonna occur
// if the var is not unowned since the var is optional, there will have no crash
print(denverAirport?.name)

