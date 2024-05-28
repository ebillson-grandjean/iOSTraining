//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Assignment-3
//Create a new playground taking any Example of your choice, to display the use of
//Below in Swift
//1. Optional variables have different types
//2. Optional binding (If let, guard let,  nil coalescing)
//3. Optional Chaining
//5. Classes and inheritance and initializers for it
//6. Structs and initialisers for it
//7. Mutating Function in struct


//1. Optional variables (different types)
let shortForm: Int? = Int("42")
let longForm: Optional<Int> = Int("42")

//The Optional type is an enumeration with two cases. Optional.none is equivalent to the nil literal. Optional.some(Wrapped) stores a wrapped value. For example:


let number: Int? = Optional.some(42)
let noNumber: Int? = Optional.none
print(noNumber == nil)
// Prints "true"


//You must unwrap the value of an Optional instance before you can use it in many contexts. Because Swift provides several ways to safely unwrap optional values, you can choose the one that helps you write clear, concise code.
//The following examples use this dictionary of image names and file paths:

let imagePaths = ["star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif"]

//2. Optional binding (If let, guard let,  nil coalescing)

//To conditionally bind the wrapped value of an Optional instance to a new variable, use one of the optional binding control structures, including if let, guard let, and switch.

if let starPath = imagePaths["star"] {
    print("The star image is at '\(starPath)'")
} else {
    print("Couldn't find the star image")
}

// Nil Coalescing example

let name: String? = nil
let unwrappedName = name ?? "Anonymous"

// Because name is an optional string, we need to unwrap it safely to ensure it has a meaningful value. The nil coalescing operator – ?? – does exactly that, but if it finds the optional has no value then it uses a default instead. In this case, the default is "Anonymous". What this means is that unwrappedName has the data type String rather than String? because it can be guaranteed to have a value.

//You don't need to create a separate variable to use nil coalescing. For example, this works fine too:

print("Hello, \(name ?? "Anonymous")!")


//3. Optional Chaining

//To safely access the properties and methods of a wrapped instance, use the postfix optional chaining operator (postfix ?). The following example uses optional chaining to access the hasSuffix(_:) method on a String? instance.

if imagePaths["star"]?.hasSuffix(".png") == true {
    print("The star image is in PNG format")
}
// Prints "The star image is in PNG format"



//5. Classes and inheritance and initializers for it

class Player {
    
    let name: String
    init(name: String) {
        self.name = name;
    }
    
    func play(){}
}

class BasketballPlayer: Player {
    override func play() {
        playingBasketBall()
    }
    
    func playingBasketBall(){
        print("\(name) is playing basketball")
    }
}


class SoccerPlayer: Player {
    override func play() {
        playingSoccer()
    }
    
    func playingSoccer() {
        print("\(name) is playing soccer")
    }
}


let player1 = BasketballPlayer(name: "Curry")
player1.play()

let player2 = SoccerPlayer(name: "Messi")
player2.play()


//6. Structs and initialisers for it
//The example below defines a new structure called Fahrenheit to store temperatures expressed in the Fahrenheit scale. The Fahrenheit structure has one stored property, temperature, which is of type Double:

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit"



//7. Mutating Function in struct

//In swift, classes are reference type whereas structures and enumerations are value types. The properties of value types cannot be modified within its instance methods by default. In order to modify the properties of a value type, you have to use the mutating keyword in the instance method. With this keyword, your method can then have the ability to mutate the values of the properties and write it back to the original structure when the method implementation ends.



struct Stack {
    public private(set) var items = [Int]() // Empty items array
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int? {
        if !items.isEmpty {
           return items.removeLast()
        }
        return nil
    }
}

var stack = Stack()
stack.push(4)
stack.push(78)
stack.items // [4, 78]
stack.pop()
stack.items // [4]

print(stack)




/*
 
 Struct vs Classes
 
 1. Classes support inheritance, Struct doesn't
 2. Classes are reference types
 3. Structs are value types
 4. Classes get stored on heap memory, structs get stored on stack memory
 5. Classes share memory location, struct doesn't
 6. Structs are immutable by default
 7. Classes need initializers whereas Structs came with built-in initializers called as members initializer
 8. Structs are faster compared to classes
 
 
 
 When to use
 1. Classes
 
 When u want in
 
 
 
 */
