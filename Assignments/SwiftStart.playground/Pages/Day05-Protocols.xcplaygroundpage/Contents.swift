//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/*
 Protocol - It is the blueprint for a set of functions or variables
 that when confirmed on class, struct, enum, we need to provide implementation
 for it
 (Interface in Java)
 
 - They don't have their own memory storage
 */

protocol MyProtocol {
    // Functions
    func doSomething()
    // Computed Properties
    var name:String {get set}
}


protocol Driving {
    
    // functions
    func applyBrakes()
    mutating func accelerateWith(_ speed:Double)
    
    // property
    var speed:Double {get set}
}


class Vehicle:Driving {
    
    var speed:Double = 0
    
    func applyBrakes() {
        print("Applying Brakes on Vehicle")
    }
    
    func accelerateWith(_ speed: Double) {
        self.speed += speed
        print("Accelerating the vehicle with speed \(self.speed)")
    }
}


let v1 = Vehicle()

v1.applyBrakes()
v1.accelerateWith(20.0)
v1.accelerateWith(30.0)



struct Truck:Driving {
    
    var speed: Double
    
    func applyBrakes(){
        print("Applying Brakes on Truck")
    }
    
    mutating func accelerateWith(_ speed: Double){
        self.speed += speed
        print("Accelerating the Truck with speed \(self.speed)")
    }
}


protocol Running:Driving { // Protocol Inheritance
    
    func isVehicleRunning() -> Bool
}


protocol Servicing {
    
    func doRepair()
}

extension Servicing {
    
    // This makes the method below optional in classes implementing the Servicing protocol
    func doRepair(){
        print("Doing a repair work")
    }
    
    // This makes the var below optional
    var speed: Double {
        return 0
    }
}

// Combination of protocols => Protocol Composition
//protocol Operating: Driving, Servicing, Running {
//    
//}

typealias Operating = Servicing & Running // Protocol Composition

class Car:Operating {
    
    var speed: Double = 10
    
    func isVehicleRunning() -> Bool {
        return true
    }
    

 //This method is optional because we have an extension for our Service Protocol
    func doRepair(){
        print("Doing a special repair for car")
    }
    
    func applyBrakes() {
        
    }
    
    func accelerateWith(_ speed: Double) {
        
    }
    
}


let car = Car()

car.doRepair()


struct Bike: Running, Servicing {
    var speed: Double = 0
    
    func applyBrakes() {
        
    }
    
    mutating func accelerateWith(_ speed: Double) {
        
    }
    
    
    func isVehicleRunning() -> Bool  {
        return true
    }
//    Commenting this line makes it possible to call the doRepair() method in the Servicing extension
//    func doRepair() {
//        
//    }
    
}


let bike = Bike()

bike.doRepair()
