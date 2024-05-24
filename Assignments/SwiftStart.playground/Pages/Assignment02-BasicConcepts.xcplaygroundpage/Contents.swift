import UIKit

var greeting = "Hello, playground"


//Assignment-2
/*
 Create new playground taking any Example of your choice, so as to display the use of
 Below in Swift

 1.Arrays
 2.Sets
 3.Dictionary
 4.Tuples and its different types and use
 5.Control Statements (if , if else, if else if else,switch, guard )
 6.Loops (for loop , while loop, repeat while)
 7.Functions and different  types of functions
*/



let dashesCount = 75

func printDashes(n:Int, hasNewLine: Bool) {
    var dash = "-"
    var dashes = ""
    for i in 1...n {
        dashes += dash
    }

    print(dashes)
    
    if hasNewLine {
        print()
    }
    
}


printDashes(n: dashesCount, hasNewLine: true)

print("Arrays\n")

//1. Arrays

// Array of Int elements
let intElements = [1, 2, 5, 7, 9, 22]
print("Array of Int elements: \(intElements)")
// Array of String elements
let stringElements = ["London", "New York City", "Paris"]
print("Array of String elements: \(stringElements)")
// Shortened forms are preferred
var shortenedFormArray : [Double] = []
shortenedFormArray.insert(25.00, at: 0)
print("Shortened form Array: \(shortenedFormArray)")
// Full type name
var fullTypeNameArray : Array<Bool> = Array()
fullTypeNameArray.insert(true, at: 0)
print("Full Type name Array \(fullTypeNameArray)")
// Preinitialized with a fixed number of values
var digits = Array(repeating: 0, count: 5)
print("Preinitialized Array: \(digits)")



printDashes(n: dashesCount, hasNewLine: true)

print("Sets\n")
//2.Sets

var devSet: Set<String> = ["Ebillson", "James", "Trey", "Emanuel", "Ebillson"]
print("Dev Set: \(devSet)")

if(devSet.count == 4) {
    print("There is 4 unique devs in our Set")
}

printDashes(n: dashesCount, hasNewLine: true)

print("Dictionary\n")
//3.Dictionary
var httpResponses = [200: "Successfull request",
                       403: "Access forbidden",
                       404: "Page not found",
                       500: "Internal Server Error"]
// usage of string describing
print("Here is our successfull request message: " + String(describing: httpResponses[200]))

var statusCodes = [200, 400, 404]
for code in statusCodes {
    if let message = httpResponses[code] {
        print("Response \(code): \(message)")
    }else{
        print("Unknown response \(code)")
    }
}


httpResponses[404] = "Not found"
httpResponses[100] = "Continue"

print(httpResponses)

printDashes(n: dashesCount, hasNewLine: true)


print("Tuples\n")
//4.Tuples and its different types and use

let product = (iphone: "X", price: 1000)
print("iPhone Model is: \(product.iphone)")
print("iPhone Price is: $\(product.price)")


let dataProvider = (["name": "Joy"], ["address": "123 Main Street"])
print("Let's pull the name from the data provided: \(dataProvider.0)")

printDashes(n: dashesCount, hasNewLine: true)


print("Conditional Statements\n")
//5.Control / Conditional Statements (if , if else, if else if else,switch, guard )

var temp = 30

if temp <= 32 {
    print("It's cold")
}

temp = 40
if temp <= 32 {
    print("It's cold")
}else{
    print("It's not that cold")
}

temp = 90
if temp <= 32 {
    print("It's cold")
} else if temp >= 86 {
    print("It's warm")
} else {
    print("It's not cold")
}

printDashes(n: dashesCount, hasNewLine: true)

print("Loops\n")
//6.Loops (for loop , while loop, repeat while)

//for-in loop
let countries = ["Haiti", "USA", "Mexico", "Canada", "Dominican Republic"]

for country in countries {
    print(country)
}

printDashes(n: dashesCount, hasNewLine: false)

let numberOfLegs = ["spider" : 8, "ant" : 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("A \(animalName) has \(legCount) legs")
}

printDashes(n: dashesCount, hasNewLine: true)

print("Functions\n")
//7.Functions and different  types of functions

// With params and return values
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greet(person: "John Doe"))
print(greetAgain(person: "John Doe"))


// Without Params
func sayHelloWorld(){
    print("Hello world!")
}

sayHelloWorld()

// With multiple params
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

printDashes(n: dashesCount, hasNewLine: false)


class User {
    // Stored property
    var name: String
    var sex: Character
    
    init(name: String, sex: Character){
        self.name = name
        self.sex = sex
    }
    
    // Computed property
    var description : String {
        "Name is: \(name) and sex is: \(sex)"
    }
    
}


func createUsers() -> User {
    
    return User(name: "Bhushan", sex: "M")
    
}

let user = createUsers()

print(user.description)

