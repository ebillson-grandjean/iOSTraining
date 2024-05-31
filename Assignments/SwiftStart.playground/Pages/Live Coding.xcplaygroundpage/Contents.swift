//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


protocol SomeProtocol {
    
    var anyProp: String {get set}
    
    mutating func someMethod(param: Double)
    
    func anotherMethod()
}


extension SomeProtocol {
    func anotherMethod(){
        print("Just to make that method optional")
    }
}

struct SomeStruct:SomeProtocol {
    var myVar: Double?
    var anyProp: String
    
    mutating func someMethod(param: Double) {
        myVar = param
        print(myVar)
    }
    
}


var someStructObj = SomeStruct(anyProp: "Hello")


someStructObj.someMethod(param: 20)


var optionalVar: String?


//optionalVar = "Optional var here!"



func displayOptionalVar() {
    guard let valueToPrint = optionalVar else {
        
        return
    }
    print(valueToPrint)
}


displayOptionalVar()


if let anotherValueToPrint = optionalVar {
    print(anotherValueToPrint)
}


print(optionalVar ?? "no value")

