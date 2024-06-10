//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)



// By default every queue is a serial queue
let queue = DispatchQueue(label: "com.app.GCD.serialQueue")

queue.async {
    print("Task 1 started")
    print("Task 1")
    print("Task 1 ended")
}

queue.async {
    print("Task 2 started")
    print("Task 2")
    print("Task 2 ended")
}


queue.async {
    print("Task 3 started")
    print("Task 3")
    print("Task 3 ended")
}


let serialQueue = DispatchQueue(label: "com.app.GCD.myNewSerialQueue")


serialQueue.async {
    for num in 0...20 {
        print(num)
    }
}

serialQueue.async {
    for num in 25...30 {
        print(num)
    }
}


serialQueue.async {
    for num in 40...50 {
        print(num)
    }
}



// Concurrent Queue

let myConcurrentQueue = DispatchQueue(label: "com.app.GCD.myConcurrentQueue", attributes: .concurrent)

// .sync makes one block execute after each other
myConcurrentQueue.async {
    print("Concurrent Queue 1 started")
    for x in 1...20 {
        print("concurrent queue 1: \(x)")
    }
    print("Concurrent Queue 1 ended")
}

myConcurrentQueue.async {
    print("Concurrent Queue 2 started")
    for x in 50...55 {
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
