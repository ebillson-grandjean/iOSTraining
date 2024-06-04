//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// Associated type - It is used for protocols to define placeholder name for the type used as part of protocol


protocol Shape {
    associatedtype AreaType
    mutating func calculateArea () -> AreaType
}

struct Square:Shape {
    
    var side: Double
    typealias AreaType = Double
 
    mutating func calculateArea() -> AreaType {
        return side * side
    }
}


var sq = Square(side: 8)
print(sq.calculateArea())


struct Circle:Shape {
    typealias  AreaType = Double
    
    var radius:Double
    
    
    func calculateArea() -> AreaType {
        return Double.pi * radius * radius
    }
}



var circ = Circle(radius: 2)
print(circ.calculateArea())


protocol Container {
    associatedtype Element
    
    mutating func add(_ element:Element)
    
    mutating func remove() -> Element?
    
}


struct StackInt:Container {
    typealias Element = Int
    private var items:[Element] = []
    
    mutating func add(_ element:Element){
        items.append(element)
    }
    
    
    mutating func remove() -> Element? {
        items.popLast()
    }
}


struct QueueString:Container {
    typealias Element = String
    private var items:[Element] = []
    
    
    mutating func add(_ element:Element){
        items.append(element)
    }
    
    mutating func remove () -> Element? {
        items.popLast()
    }
}
