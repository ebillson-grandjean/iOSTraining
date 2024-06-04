//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

print(greeting)

// Dependency Injection - DI
// Whatever the class needs to perform the functionality we should be able to pass it through outside, instead of
// hardcoding things
// 1. Constructor Injection
// 2. Property Injection
// 3. Method Injection


protocol CalculatorServiceProtocol {
    func addNums(num1: Int, num2: Int) -> Int
}

class CalculationService:CalculatorServiceProtocol {
    func addNums(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}


class WebService {
    
    
    func callAPI(){
        
    }
    
    func callingAPIWithURL(apiURL: String){
        
    }
}


class ViewController {
    
    
    let cal : CalculatorServiceProtocol // Dependency Inversion => passing the protocol instead of the 'CalculationService'
    var webService: WebService?
    
    init(cal: CalculatorServiceProtocol) { // Constructor Injection
        self.cal = cal
    }
    
    func doCalculation() {
        let result = self.cal.addNums(num1: 10, num2: 20)
    }
    
    func callingAPIs() {
        webService?.callAPI()
    }
    
    func specificTask(webService: WebService) {
        webService.callAPI()
    }
    
    func callAPI(url: String){
//        URLSession.shared.data(from: URL(string: url))
    }
}



let v1 = ViewController(cal: CalculationService()) // Constructor Injection
v1.doCalculation()

v1.webService = WebService() // 2. Property Injection
v1.doCalculation()
v1.callingAPIs()
v1.callAPI(url: "api.com/v/") // 3. Method Injection
