//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


/*
 //Assignment-12
 Create new playground taking any example of your choice, so as to display the use of below in Swift:

 1.DispatchWorkItem
 2.AwaitAsync
 3.actor
 4. AsyncLet
 */



//1.DispatchWorkItem

let queue = DispatchQueue(label: "com.egj.DispatchQueue")

let workItem = DispatchWorkItem {
    print("Some specific task")
}

// Calling the Task
queue.async(execute: workItem)

// Calling the Task after some delay (2 seconds)

queue.asyncAfter(deadline: DispatchTime.now() + 2, execute: workItem)

workItem.cancel()

if workItem.isCancelled {
    print("Work Item is cancelled!")
}
//2.AwaitAsync

func doAPICall() async {
    print("Doing some API Calls...")
}

Task {
    do {
        try await doAPICall()
    }catch {
        print(error.localizedDescription)
    }
}


//3.Actor
/*
 An actor is a reference type introduced in Swift 5.5 as part of its advanced concurrency model.
 Its primary role is to prevent data races and ensure safe access to shared mutable state in concurrent programming environments.
 */

actor BankAccount {
    private var balance: Double
    
    
    init(balance: Double) {
        self.balance = balance
    }
    
    
    func deposit (amount: Double) -> Void {
        self.balance += amount
    }
    
    
    func withdraw (amount: Double) {
        guard balance >= amount  else {return}
        self.balance -= amount
    }
    
    func printBalance() {
        print("Your current balance is: $\(self.balance)")
    }
    
}


let account = BankAccount(balance: 200)

Task {
    await account.printBalance()
}

Task {
    await account.deposit(amount: 50.75)
}

Task {
    await account.printBalance()
}

Task {
    await account.withdraw(amount: 20.25)
}

Task {
    await account.printBalance()
}


//4. AsyncLet

enum APIError:Error{
    case invalidUrl
    case requestFailed
    case httpError(code: Int)
    case unknown
}


func getRequest(url:URL) async throws -> Data {
    do {
        let (data, response ) = try await URLSession.shared.data(from: url)
        if let response = response as? HTTPURLResponse {
            if response.statusCode < 200 || response.statusCode > 299 {
                throw APIError.httpError(code: response.statusCode)
            }
        }
        
        return data
        
    }catch{
        throw error
    }
}


let postsURL = URL(string: "https://jsonplaceholder.typicode.com/posts")
let commentsURL = URL(string: "https://jsonplaceholder.typicode.com/comments")
let usersURL = URL(string: "https://jsonplaceholder.typicode.com/users")

Task {
    do {
        async let postsData = getRequest(url: postsURL!)
        async let commentsData = getRequest(url: commentsURL!)
        async let usersData = getRequest(url: usersURL!)
        
        let result1 = try await postsData
        let result2 = try await commentsData
        let result3 = try await usersData
        
        print(result1)
        print(result2)
        print(result3)
        
    }catch {
        print("Error")
        print(error.localizedDescription)
    }
}
