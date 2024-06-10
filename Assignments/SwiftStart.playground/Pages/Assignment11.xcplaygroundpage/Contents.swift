//: [Previous](@previous)

import Foundation
import UIKit

var greeting = "Hello, playground"

//: [Next](@next)

/*
 Assignment-11
 Create new playground taking any example of your choice, so as to display the use of below in Swift:

 1.GCD
 2.Main queue
 3.Custom queue
 4. Global queues and different qos usage
 5. Operation Queue
 6. Custom Operation
 Note- Make sure your assignments covers all tech points which discussed in classroom for above topics, have in depth examples for each one above.
 */


/* 
     1. GCD - FIFO - First In First Out
     3 types of queues
     GCD - Low level API provided by apple for multithreading, GCD uses threads internally
     We can perform our asynchronous tasks concurrently
     3 types of queues:
     1. Main Queue
     2. Custom Queue
     3. Global Queues - system provided queues shared by the app
*/


/*
    2. Main Queue
    1. Updating UI Elements
    2. Loading Images asynchronously
    3. Animating our views
    4. Handling notifications
    5. CoreData fetching
 */

// Loading images asynchronously
func loadImageFromURL(url:URL){
    
    DispatchQueue.global().async {
        if let data = try?  Data (contentsOf: url), let image = UIImage(data: data){
            // main thread use
            DispatchQueue.main.async {
                // self.imageView.image = image
            }
        }
    }
    
}

// 3.Custom queue

// By default every queue is a serial queue
let serialQueue = DispatchQueue(label: "com.app.GCD.SerialQueue")


serialQueue.async {
    print("Serial Queue 1")
    for num in 0...5 {
        print(num)
    }
}

serialQueue.async {
    print("Serial Queue 2")
    for num in 6...12 {
        print(num)
    }
}

// We also have concurrent queues
let myConcurrentQueue = DispatchQueue(label: "com.app.GCD.ConcurrentQueue", attributes: .concurrent)

// .sync makes one block execute after each other
myConcurrentQueue.async {
    print("Concurrent Queue 1 started")
    for x in 20...30 {
        print("concurrent queue 1: \(x)")
    }
    print("Concurrent Queue 1 ended")
}

myConcurrentQueue.async {
    print("Concurrent Queue 2 started")
    for x in 50...54 {
        print("concurrent queue 2: \(x)")
    }
    print("Concurrent Queue 2 ended")
}

myConcurrentQueue.async {
    print("Concurrent Queue 3 started")
    print("Concurrent Queue 3 ended")
}



myConcurrentQueue.sync {
    print("Concurrent Queue 4 started")
    for x in 0...5 {
        print("Concurent Queue 4 \(x)")
    }
    print("Concurrent Queue 4 ended")
}

myConcurrentQueue.sync {
    print("Concurrent Queue 5 started")
    print("Concurrent Queue 5 ended")
}

/*
 4. Global queues and different qos usage
 Global Queues - These are system provided queues. They have different quality of service (QOS)
 QOS - it tells the system what is the priority of the task
 */

DispatchQueue.global().async {
    print("This is a Global Queue")
}


/*
 Different QOS Usages
 1. User interactive
 2. User initiated
 3. Utility
 4. Default
 5. Background
 6. Unspecified
 
 */


DispatchQueue.global(qos: .default).async {
    print("Doing a task on the default qos")
}


// 1. User interactive
// For animations or for any UI related job which will require UI updates
// For tasks that interact with user and require immediate results


func playVideo() {
    
    let queue = DispatchQueue.global(qos: .userInteractive)
    
    queue.async {
        print("Logic for playing or pausing Video")
        DispatchQueue.main.async {
            print("Updating UI for video play/pause button")
        }
    }
}

playVideo()

/*
 5. OperationQueue - It gives us more control of when we can start, pause, cancel, stop, resume tasks
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
//operationQueue.addOperation(task3)

task2.addDependency(task3)
task1.addDependency(task3)

operationQueue.addOperations([task1, task2, task3], waitUntilFinished: false)


let otherTask1 = BlockOperation {
    print("other task1")
}

let otherTask2 = BlockOperation {
    print("other task2")
}

let otherTask3 = BlockOperation {
    print("other task3")
}


let otherOperationQueue = OperationQueue()
otherOperationQueue.addOperations([otherTask1, otherTask2, otherTask3], waitUntilFinished: false)
otherOperationQueue.maxConcurrentOperationCount = 1


let someOtherOperationQueue = OperationQueue()

let newTask = BlockOperation {
    print("new task")
}

someOtherOperationQueue.addOperation(newTask)

newTask.cancel()
someOtherOperationQueue.cancelAllOperations()


// 6. Custom Operation
class SomeOperation: Operation {
    
    var someProp: URL
    
    init(someProp: URL) {
        self.someProp = someProp
    }
    
    
    override func main() {
        let data = try? Data(contentsOf: self.someProp)
        // some processing
    }
    
    override func start() {
        <#code#>
    }
    
    override func cancel() {
        // co
    }
}
