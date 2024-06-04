//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


//Assignment-7
//Create new playground taking any example of your choice, so as to display the use of below in Swift:
//1.Memory Management in iOS (ARC, should be able to explain it with example)
//2. Show use of strong week unowned
//3.Show how to break retain cycle with example
//4. Generics (functions,classes,structs, data structures, constraints with Generics )
//Prepare Theoretical part for above topics as well, We will have question answer session for it.
//Also we are gonna see live coding for on above topics in classroom so be ready to write code for those



//1.Memory Management in iOS (ARC, should be able to explain it with example)

//Memory management is the efficient use and control of memory during the execution of a computer program. This process involves a set of rules related to dynamically allocating, using, and releasing memory during the program’s runtime.
// It affects the performance, reliability and overall health of a program


// Allocation
// Reserving space in memory for variables or data structures

// Deallocation
// When the allocated memory is no longer needed it must be released by the program. Otherwise, memory leaks occur.

// Memory Leaks
// While the application is running it utilizes a portion of a device's memory.
// When the application is closed, this portion of the memory is reclaimed by the system
// When the application continues to use memory even if it doesn't need it it's called memory leak




//1.Memory Management in iOS (ARC, should be able to explain it with example)
//2. Show use of strong week unowned

class User {
    
    var name : String
    var email: String
    weak var subscription: Subscription? // Since the user is the main object, it makes sense to make the subscription obj weak
    
    init(name: String, email: String, subscription: Subscription? = nil) {
        self.name = name
        self.email = email
        self.subscription = subscription
        
        print("Init for User Obj")
    }
    
    deinit {
        print("DeInit for User Obj")
    }
}


class Subscription {
    var planName: String
    var monthlyPrice: Double
    var user: User?
    
    init(planName: String, monthlyPrice: Double, user: User? = nil) {
        self.planName = planName
        self.monthlyPrice = monthlyPrice
        self.user = user
        
        print("Init for Subscription Obj")
    }
    
    deinit {
        print("DeInit for Subscription Obj")
    }
}


// When no object is created, in the ARC, the retain count is 0
var user1:User? = User(name: "Bill", email: "email@email.com", subscription: nil) // 0 + 1 = 1
user1 = nil // 1 - 1 = 0 => retain count just goes back to 0, memory is freed

var user2:User? = User(name: "John", email: "john@email.com", subscription: nil) // 0 + 1 = 1
var user3 = user2 // 1 + 1 => 2

weak var user4 = user2 // no increment 2 = 2

var user5:User? = User(name: "Jane", email: "jane@email.com", subscription: nil)
unowned var user6 = user5
weak var user7 = user5

user5 = nil

// cannot do user6?.name, it causes a crash

// can do, it's just gonna print nil
print(user7?.name)


//3.Show how to break retain cycle with example

var myUser:User? = User(name: "Mary", email: "mary@email.com", subscription: nil)
var myUserSubscription:Subscription? = Subscription(planName: "Basic Plan", monthlyPrice: 5.99, user: myUser)
myUser?.subscription = myUserSubscription

myUser = nil
myUserSubscription = nil


//4. Generics (functions,classes,structs, data structures, constraints with Generics )

// functions

func swapValues<T>(_ a: inout T, _ b: inout T){
    let temp = a
    a = b
    b = temp
}


var x = 1
var y = 2

print("Before swap x = \(x) and y = \(y)")
swapValues(&x, &y)
print("After swap x = \(x) and y = \(y)")

var str1 = "A"
var str2 = "B"

print("Before swap str1 = \(str1) and str2 = \(str2)")
swapValues(&str1, &str2)
print("After swap str1 = \(str1) and str2 = \(str2)")



struct Stack<T> {
    
    var items: [T] = []
    
    mutating func push(_ element: T){
        items.append(element)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
}


var stackOfInt = Stack<Int>()

stackOfInt.push(1)
stackOfInt.push(11)
stackOfInt.push(111)
stackOfInt.push(1111)

print(stackOfInt)
stackOfInt.pop()
print(stackOfInt)


var stackOfString = Stack<String>()
stackOfString.push("Happy")
stackOfString.push("Birthday")
stackOfString.push("Jane")
stackOfString.push("!")

print(stackOfString)
stackOfString.pop()
print(stackOfString)



