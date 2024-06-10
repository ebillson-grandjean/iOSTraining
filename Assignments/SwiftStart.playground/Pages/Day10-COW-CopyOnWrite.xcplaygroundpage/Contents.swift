//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/*
 COW - Copy On Write
 This technique is used by OS to avoid memory duplication
 until you modify one of them, it refers to the same memory location
 This is applicable for value types: array, dictionnary, set, struct
 tuple, enum
 Only one copy of data is maintained until modification is done
 This reduces memory footprint, this is useful for large data set
 It improves performance, avoid unnecessary data duplication
 This concept is not applicable for reference types like classes
 */

var array1 = [1, 2, 3, 4] // 0x1000
var array2 = array1 // 0x1000 => Creating a shallow copy

func arraysEqual(array1: [Int], array2: [Int]) {
    if array1.elementsEqual(array2) {
        print("Both arrays are equal")
    } else {
        print("Arrays are not equal")
    }
}

arraysEqual(array1: array1, array2: array2)

array1.append(5) // copy on write, happens only for value types, does not happen with classes

arraysEqual(array1: array1, array2: array2)

print(array1)
print(array2)


