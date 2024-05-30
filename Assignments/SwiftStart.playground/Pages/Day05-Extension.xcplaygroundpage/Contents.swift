//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


/*
 Extension - means adding new functionality or behavior to existing classes, structs or data types
 
 */



extension Int {
    
    func doSquare() -> Int {
        let square =  self * self
        return square
    }
}


let number = 5
let result = number.doSquare()
print("The square of 5 is \(result)")


extension String {
    func makeItCapital() -> String {
        let capital = self.capitalized
        return capital
    }
}

print("From lowercase to capital case".makeItCapital())


class Temperature{
    var celsius = 0.0
    
    func setTemp(celsius: Double){
        self.celsius = celsius
        print(self.celsius)
    }
}



let temp1 = Temperature()
temp1.setTemp(celsius: 20)

extension Temperature {
    // Extensions cannot contain stored properties like below
//    var newVar = "Hey I'm a new var"
    
    func convertToFahreneit(){
        var value = celsius * 1.8 + 32
        print(value)
    }
}


temp1.convertToFahreneit()
