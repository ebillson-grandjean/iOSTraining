//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//let closure = () -> ()
//closure()

/*
 Closure - Unnamed block of code which you can assign to a variable
 or you can pass as a parameter to a function or you can return from that function as well
 
 */

func sayHello() {
    print("sayHello")
}

sayHello()


let sayHelloClosure = {
    print("sayHelloClosure")
}

sayHelloClosure()


func makeSquareOfNum(num: Int, completion: (Int) -> ()){
    
    let square = num * num
    completion(square)
}


makeSquareOfNum(num: 5, completion: {result in print("Result is \(result)")})


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


// Closures are reference types, they are stored on the heap memory

class Vehicle {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func displayInfo(){
        let closure = { [weak self] in // The weak keyword tells the ARC to not increase the retain count by 1
            // weak self is needed when in a class
            print("Vehicle is \(self?.name ?? "" )")
            
        }
    }
}
