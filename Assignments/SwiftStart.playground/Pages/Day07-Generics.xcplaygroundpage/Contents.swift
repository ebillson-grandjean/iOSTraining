//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


// Generics - Allows you to write reusable code,
// which makes code work with any data type by defining a placeholder which can contain any data type instead of a specific data type



func displayData(data: String){
    print(data)
}


displayData(data: "Hello World!")


//displayData(data: 123)


func displayData(data: Int){
    print(data)
}


displayData(data: 123)


func displayDataGeneric<T>(data: T){
    print(data)
}


displayDataGeneric(data: "Hey")
displayDataGeneric(data: 345)
displayDataGeneric(data: 34.5)
displayDataGeneric(data: true)


func swapValues<T>(a: inout T, b: inout T){
    
    let temp = a
    a = b
    b = temp
}


var x = 10
var y = 20

print("Before swap: \(x) and \(y)")
swap(&x, &y)
print("After swap: \(x) and \(y)")


// Generics for class

class Information<T> {
    
    var data: T
    
    init(data: T) {
        self.data = data
    }
    
    
    func getMyData() -> T {
        return data
    }
    
    
    func setMyData(newData: T) {
        self.data = newData
    }
}


let information = Information(data: "iOS")
print(" \(information.getMyData())")




// Generics for queue

struct Queue<T> {
    
}



// Generics for enums

enum Rewards<T> {
    case firstPrize(T)
    case secondPrize
    case runner(T)
    
    
    var display: String {
        switch self {
        case .firstPrize(let prize):
            return "I came first, my reward is \(prize)"
        default:
            return "I didn't win"
        }
    }
}

let msg = Rewards.firstPrize(1000)
print(msg.display)

print(Rewards.runner(true).display)



func doAddition<T: Numeric> (num1: T, num2: T) -> T {
    return num1 + num2
}


print(doAddition(num1: 10, num2: 25))



