import UIKit


//Assignment-1 for today
/*
 Create new playground taking any Example of your choice, so as to display the use of
Below in Swift
1.Constants
2.Variables
3.Type Inference
4.Type Safety
5.OOP principle
6. Explain OOP different pillars with example

Prepare Theoretical part for above topics as well, I will be asking questions on above topics and everyone should be able to ans those.
Everyone needs to present these solutions tomorrow in classroom.
 */

    
//1.Constants
    
let ipAddress : String = "192.168.1.1"
//ipAddress = "192.168.1.2"
let port : String = "8080"
//port = "8081"
print(ipAddress + ":" + port)
    
//2.Variables

var counter : Int = 1
counter += 1
print(counter)
    
//3.Type Inference

var city = "Atlanta"
var anotherCity : String = "London"

//4.Type Safety

city = "Marietta"
//city = 1
// city = true

//5.OOP principle

//Classes
class A {
    
}

//Objects
var obj = A()

//Properties & Methods
class Person {
    
    var age: Int!
    var name: String!
    var sex: Character!
    var isDeveloper: Bool!
    var salary: Double!
    
    init(age: Int, name: String, sex: Character, isDeveloper: Bool, salary: Double) {
        self.age = age
        self.name =  name
        self.sex = sex
        self.isDeveloper = isDeveloper
        self.salary = salary
    }
    
    func displaySomeProps(){
        print(name + " is " + String(age) + " years old")
    }
    
    
    // Method Overloading
    func displaySomeProps(salary: Double) {
        self.salary = salary
        print(name + "'s salary is: " + String(salary) + " US Dollars")
    }
    
}

//I- Access Control

//Open access and public access — Entities with this access level can be accessed within the module that they are defined as well as outside their module.
//Internal access — Entities with this access level can be accessed by any files within the same module but not outside of it.
//File-private access — Entities with this access level can only be accessed within the defining source file.
//Private access — Entities with this access level can be accessed only within the defining enclosure.

//II- Encapsulation

class Calculation {
    let a: Int!
    let b: Int!
    
    private var result: Int?
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
    
    func add(){
        result = a + b
    }
    
    func displayResult() {
        print("Result: \(result)")
    }
}


let calculation = Calculation(a:2, b:6)

calculation.add()
calculation.displayResult()


//We declared a Maths class which does up some mathematical calculations.

//We declared two variables required for inputting values.

//Initialise the variables.

//We declare a method to add the two variables

//And then another method to display the result.

//In the above example, we encapsulated the variable “result” by using the access specifier “private”. We hide the data of variable “result” from any outside intervention and usage.


//III- Abstraction

//Abstraction is an OOP concept by which we expose relevant data and methods of an object hiding its internal implementation.
//
//Eg. When we go to a shop to buy a product, we just get the product that we want. The shopkeeper doesn’t tell us how the product was bought. We can think of this as an example of abstraction.
//
//In our example in encapsulation, we are exposing displayTotal() and add() method to the user to perform the calculations, but hiding the internal calculations.


//IV- Inheritance

class Professional: Person {
    
    
}

let proObj = Professional(age: 27, name: "Ebillson", sex: "M", isDeveloper: true, salary: 250000.00)
print(proObj.name)


//V- Method Overloading
proObj.displaySomeProps()
proObj.displaySomeProps(salary: proObj.salary)

//VI- Method Overriding

class OtherProfessional: Person {
    
    override init(age: Int, name: String, sex: Character, isDeveloper: Bool, salary: Double) {
        super.init(age: age, name: name, sex: sex, isDeveloper: isDeveloper, salary: salary)
    }
}

let otherProObj = OtherProfessional(age: 37, name: "Zuck", sex: "M", isDeveloper: true, salary: 100000000000000.00)

    
//VII- Polymorphism

class Player {
    
    let name: String
    init(name: String) {
        self.name = name;
    }
    
    func play(){}
}

class BasketballPlayer: Player {
    override func play() {
        playingBasketBall()
    }
    
    func playingBasketBall(){
        print("\(name) is playing basketball")
    }
}


class SoccerPlayer: Player {
    override func play() {
        playingSoccer()
    }
    
    func playingSoccer() {
        print("\(name) is playing soccer")
    }
}


let player1 = BasketballPlayer(name: "Curry")
player1.play()

let player2 = SoccerPlayer(name: "Messi")
player2.play()
