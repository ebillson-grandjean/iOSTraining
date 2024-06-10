//: [Previous](@previous)

import Foundation
import UIKit

var greeting = "Hello, playground"

//: [Next](@next)


// Thread: A single basic unit of execution within within the process
// Thread will allow to perform multiple tasks concurrently

/*
 Multithreading: Doing multiple tasks async
 
 1- GCD - Grand Central Dispatch
 2- Operation & Operation Queue
 3- Await Async - Swift Concurrency from iOS 13.0 (2019)
 4- DispatchGroups
 5- DispatchBarrier
 6- Libraries - Combine, 3rd party frameworks like: RXSwift, RxCococ, AsyncDisplayKit
 7- NSThread / Thread
 8- Semaphores
 */



let thread = Thread{
    print("This will run in background...")
}

thread.start()
thread.cancel()


/*
 GCD - FIFO - First In First Out
 3 types of queues
 GCD - Low level API provided by apple for multithreading, GCD uses threads internally
 We can perform our asynchronous tasks concurrently
 3 types of queues:
 1. Main Queue
 2. Custom Queue
 3. Global Queues - system provided queues shared by the app
 */


/* 
 
 1. Main Queue
    1. Updating UI Elements
    2. Loading Images asynchronously
    3. Animating our views
    4. Handling notifications
    5. CoreData fetching
 
 */

DispatchQueue.main.async{
    print("Perform this task on main thread")
}


// UI Update task
DispatchQueue.main.async{
    // self.label.text = "Swift"
    // self.tableView.reloadView()
}


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

// Animating views

DispatchQueue.main.async {
    UIView.animate(withDuration: 1.0) {
        // self.view.alpha = 0.5
    }
}


// Do a task in the main thread with some delay

DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    print("This task will happen on main thread after 2 secs")
//    sleep(10000) => Definitely do not do that
}


let workItem = DispatchWorkItem {
    print("work item")
}
