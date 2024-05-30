//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


/*
 Assignment-5
 Create new playground taking any Example of your choice, so as to display the use of
 Below in Swift
 1.Protocols
 optional methods/properties in protocol, protocol inheritance, composition
 2.Extension and its different uses
 3. Closures and its different types and uses
 Prepare Theoretical part for above topics as well, We will have question answer session for it.
 Also we are gonna see live coding for protocols in classroom so be ready to write code for protocols
 */


//1.Protocols
// optional methods/properties in protocol, protocol inheritance, composition

protocol FirstProtocol {
    
    func firstMethodInFirstProtocol()
    
    func secondMethodInFirstProtocol()
    
    func thirdMethodInFirstProtocol()
    
    func optionalMethodInFirstProtocol()
    
}


extension FirstProtocol {
    
    func optionalMethodInFirstProtocol(){
        print("optionalMethodInFirstProtocol")
    }
}



class SomeClass:FirstProtocol {
    
    func firstMethodInFirstProtocol(){
        print("Implementation of firstMethodInFirstProtocol")
    }
    
    func secondMethodInFirstProtocol(){
        print("Implementation of secondMethodInFirstProtocol")
    }
    
    func thirdMethodInFirstProtocol(){
        print("Implementation of thirdMethodInFirstProtocol")
    }
}


let someClassObj = SomeClass()

someClassObj.firstMethodInFirstProtocol()
someClassObj.secondMethodInFirstProtocol()
someClassObj.thirdMethodInFirstProtocol()

print()

class SomeOtherClass:FirstProtocol {
    func firstMethodInFirstProtocol(){
        print("Implementation of firstMethodInFirstProtocol in SomeOtherClass")
    }
    
    func secondMethodInFirstProtocol(){
        print("Implementation of secondMethodInFirstProtocol in SomeOtherClass")
    }
    
    func thirdMethodInFirstProtocol(){
        print("Implementation of thirdMethodInFirstProtocol in SomeOtherClass")
    }
    
    func optionalMethodInFirstProtocol(){
        print("optionalMethodInFirstProtocol impl in SomeOtherClass")
    }
}


let someOtherClassObj = SomeOtherClass()
someClassObj.firstMethodInFirstProtocol()
someClassObj.optionalMethodInFirstProtocol()

print()

protocol Mother {
    
    func hasBlackHair()
    
    func hasBeautifulEyes()
}


protocol Father {
    
    func hasBigNose()
    
    func hasBigEars()
}


typealias MomAndDad = Mother & Father


class Child:MomAndDad {
    
    func hasBlackHair() {
        print("hasBlackHair impl")
    }
    
    func hasBeautifulEyes() {
        print("hasBeautifulEyes impl")
    }
    
    func hasBigNose(){
        print("hasBigNose impl")
    }
    
    func hasBigEars(){
        print("hasBigEars impl")
    }
}


print()

let childObj = Child()
childObj.hasBlackHair()
childObj.hasBeautifulEyes()
childObj.hasBigNose()
childObj.hasBigEars()

print()

//2.Extension and its different uses


extension Mother {
    
    func beautifulSmile(){
        print("beautifulSmile")
    }
}


class OtherChild:Mother {
    
    func hasBlackHair() {
        print("hasBlackHair OtherChild")
    }
    
    func hasBeautifulEyes(){
        print("hasBeautifulEyes OtherChild")
    }
}

let otherChildObj = OtherChild()
otherChildObj.hasBeautifulEyes()
otherChildObj.beautifulSmile()



//3. Closures and its different types and uses


/*
 
 Types of closure
 1- Non-escaping closure (default)
 2- Escaping Closure
 3- Trailing Closure
 4- Auto Closure
 
 */


func nonEscapingClosure(onCompletion: () -> ()){
    onCompletion()
    print("non escaping func end")
}

nonEscapingClosure(onCompletion: {print("nonEscapingClosureExample")})

func escapingClosure(onCompletion: @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + 10){
        onCompletion()
    }
    print("escaping func end")
}

escapingClosure(onCompletion: {print("escapingClosureExample")})


//3. Trailing closure - When closure is the last parameter to a func it's called trailing closure

func doAddition(value: Int, onSuccess closure: (Int) -> Void){
    closure(value + value)
}

doAddition(value: 3) {
    output in print("Output of addition is \(output)")
}


//4. Autoclosure - when a closure gets automatically wrapped in a closure and doesn't return any parameter nor return any parameter

func greetPeople(wishThem: () -> ()){
    print("Good morning")
    wishThem()
}


greetPeople {
    print("Have a nice day")
    print("Bye bye")
}



// uses

// Capturing Values

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}


let incrementByTen = makeIncrementer(forIncrement: 10)
print("Incrementing by 10: \(incrementByTen())")
print("Incrementing by 10: \(incrementByTen())")
print("Incrementing by 10: \(incrementByTen())")


