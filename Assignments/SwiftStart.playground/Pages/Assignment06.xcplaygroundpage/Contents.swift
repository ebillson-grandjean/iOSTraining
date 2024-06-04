//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

////Assignment-6
//Create new playground taking any example of your choice, so as to display the use of below in Swift:
//1.Types of properties
//2.Capture list
//3.Higher order funtions
//Prepare Theoretical part for above topics as well, We will have question answer session for it.
//Also we are gonna see live coding for on above topics in classroom so be ready to write code for those




//1.Types of properties


//Stored Properties
//a stored property is a constant or variable that’s stored as part of an instance of a particular class or structure
struct StructWithProp {
    
    var myVar: String
    let myConstant: String
}


var structWithPropObj = StructWithProp(myVar: "Varies", myConstant: "Is constant")

// Can change the var
structWithPropObj.myVar = "I just changed it"

// Cannot change the constant
//structWithPropObj.myConstant = "Cannot change it"



// Lazy stored property
//property whose initial value isn’t calculated until the first time it’s used.


class DataImporter {
    
    var fileName = "file.json"
}


class DataManager {
    
    lazy var importer = DataImporter()
    var data: [String] = []
}


let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager.data.append("Even more data")

print(manager.importer.fileName)


//Computed Properties

//They provide a getter and an optional setter
//to retrieve and set other properties and values indirectly.

struct File {
    var name: String
    let fileExtension: String
    
    // Computed property to generate filename
    var fileName: String {
        return name + "." + fileExtension
    }
}


let file = File(name: "Cracking the Coding Interview", fileExtension: "pdf")
print(file.fileName)

//2.Capture list

//capture list creates a local variable in the closure.
//It is initialized with the value of the variable with the same name in the outer context.

var a = 0
var b = 1

let closure = { [a] in
    print(a, b)
}
closure()


a = 5
b = 20
closure()

//3.Higher order funtions

let numbers = [0, 3, 2, 1, 6]

// sorted
let numbersSortedByAsc = numbers.sorted()
print(numbersSortedByAsc)

let numbersSortedByDesc = numbers.sorted{ (a, b) -> Bool in
    return a > b
}
print(numbersSortedByDesc)


// map
let numbersAsStrings = numbers.map{ (a) in return String(a)}

print(numbersAsStrings)


// filter

let numbersGreaterThanTwo = numbers.filter{(a) in return a > 2}
print(numbersGreaterThanTwo)


// inline filter

let inlineNumbersLesserThanFour = numbers.filter{ $0 < 4}

print(inlineNumbersLesserThanFour)


// zip

let firstArr = ["a", "b", "c"]
let secondArr = ["d", "e", "f"]
let combined = Array(zip(firstArr, secondArr))
print(combined)



let myArr = [1, 2, 4, 5]

let descArr = myArr.sorted{ $0 > $1}

print(descArr)
