//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
 1. COW - Copy On Write
 
 This technique is used by OS to avoid memory duplication
 until you modify one of them, it refers to the same memory location
 This is applicable for value types: array, dictionnary, set, struct
 tuple, enum
 Only one copy of data is maintained until modification is done
 This reduces memory footprint, this is useful for large data set
 It improves performance, avoid unnecessary data duplication
 This concept is not applicable for reference types like classes
 
 */


var fruitsArr1 = ["Apple", "Banana"]
    
var fruitsArr2 = fruitsArr1
    
    
func areArraysEqual(array1: [String], array2: [String]) -> String{
    if array1.elementsEqual(array2) {
        return "Both arrays are equal"
    }
    
    return "The 2 arrays are not equal"
}


var result: String = areArraysEqual(array1: fruitsArr1, array2: fruitsArr2)
print(fruitsArr1)
print(fruitsArr2)
print(result)

fruitsArr1.append("Watermelon")

print(fruitsArr1)
print(fruitsArr2)

print(areArraysEqual(array1: fruitsArr1, array2: fruitsArr2))

