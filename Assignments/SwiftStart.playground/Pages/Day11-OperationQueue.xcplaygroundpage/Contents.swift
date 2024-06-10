//: [Previous](@previous)

import Foundation
import UIKit

var greeting = "Hello, playground"

//: [Next](@next)


/*
 OperationQueue - It gives us more control of when we can start, pause, cancel, stop, resume tasks
 
 We can monitor the progress
 We can set dependencies
 */

let task1 = BlockOperation {
    print("task1")
}

let task2 = BlockOperation {
    print("task2")
}

let task3 = BlockOperation {
    print("task3")
}


let operationQueue = OperationQueue()

//operationQueue.addOperation(task1)
//operationQueue.addOperation(task2)

//task2.addDependency(task3)
//task1.addDependency(task3)

operationQueue.addOperations([task1, task2, task3], waitUntilFinished: false)
operationQueue.maxConcurrentOperationCount = 1

let operationQueue123 = OperationQueue()

let task4 = BlockOperation {
    print("task4")
}

operationQueue123.addOperation(task4)

task4.cancel()
operationQueue123.cancelAllOperations()



// Custom Operation

class ImageDownloadManager: Operation {
    
    var url: URL
    var image: UIImage?
    
    init(url: URL) {
        self.url = url
    }
    
    
    override func main() {
        let data = try? Data(contentsOf: self.url)
        image = UIImage(data: data!)
    }
    
//    override func start(){}
//    override func cancel(){}
//    override func pause(){}
    
}


let downloadQueue = OperationQueue()
//let ops =






// Copy On Write


var fruitsArr1 = ["Apples", "Peaches", "Bananas"]  // 0x10101

var fruitsArr2 = fruitsArr1 // 0x10101


func areArraysEqual(arr1: [String], arr2: [String]) -> String {
    if arr1.elementsEqual(arr2) {
        return "Both arrays are equal!"
    }
    
    return "The 2 arrays are not equal"
}

print(fruitsArr1)
print(fruitsArr2)
print(areArraysEqual(arr1: fruitsArr1, arr2: fruitsArr2))

fruitsArr1.append("Watermelon")

print(fruitsArr1)
print(fruitsArr2)

print(areArraysEqual(arr1: fruitsArr1, arr2: fruitsArr2))


