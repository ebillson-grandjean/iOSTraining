//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


// Enum: a group of related data types

enum Direction {
    
    case up
    
    case down
    
    case left
    
    case right
}


let leftDirection = Direction.left
print(leftDirection)
print(Direction.right)




enum RainBowColor:CaseIterable {
    
    case violet, indigo, green, blue, yellow, orange, red
}


print(RainBowColor.indigo)


for color in RainBowColor.allCases {
    print(color)
}


// 2 types of enum
// 1. RawValue enum
// 2. AssociatedType enum


// 1. RawValue enum
enum CarBrand:String {
    
    case Honda = "Known for its build quality"
    case Tesla = "Electric Vehicle"
    case Mercedes = "String value it should be!!!"
}

print(CarBrand.Honda.rawValue)


// 2. AssociatedType enum

enum CarPrice {
    case highEnd(price: Int)
    case midEnd(price: Double)
    case lowEnd(message: String)
}

func getCarPrices(for modelType:CarPrice){
    switch modelType {
    case .highEnd(let price):
        print("This is a highEnd car with price \(price)")
    case .midEnd(let price):
        print("This is a midEnd car with price \(price)")
    case .lowEnd(let message):
        print("This is a lowEnd car with message \(message)")
    default:
        print("Unable to buy car")
    }
}


getCarPrices(for: .highEnd(price: 100000))
getCarPrices(for: .midEnd(price: 255000))
getCarPrices(for: .lowEnd(message: "Low Budget"))


enum WeekDay:Int {
    
    case Monday = 100
    case Tuesday
    case Wednesday
    case Thursday = 2000
    case Friday
    case Saturday
    case Sunday
    
    
//    var numberOfDays  => Enums must not contain stored properties
    
    var dayType:String {
        self == .Saturday ? "Weekend" : "Weekdays"
    }
    
    func isItHoliday() -> Bool {
//        self.numberOfDays = 7  => cannot contain stored properties
//        self.dayType = "Any day"
        return self == .Sunday ? true : false
    }
}


print(WeekDay.Monday.rawValue)
print(WeekDay.Tuesday.rawValue)
print(WeekDay.Thursday.rawValue)
print(WeekDay.Friday.rawValue)
print(WeekDay.Friday.dayType)
print(WeekDay.Saturday.dayType)
print(WeekDay.Sunday.isItHoliday())



// Use cases

enum CustomButton {
    
    case roundCorner
    case squareCorner
    case iconButton
}

enum NetworkError {
    case dataNotFound
    case invalidURLError
    case invalidResponse
    case none
}
