//
//  ViewController.swift
//  Day19-2-DesignPatterns
//
//  Created by Ebillson Grand Jean on 6/18/24.
//
/*

Architecture Pattern - One for a project
 
1- MVC - Model View Controller
2- MVP - Model View Presenter
3- MVVM - Model View ViewModel
4- MVVM-C / Repository Patter - Model View ViewModel Coordinator
5- VIPER - View Interactor Presenter Entity Router
6- Clean Architecture
7- TCA - The Composable Architecter
8- RIB - Router Interactor Builder (Uber)
 
Design Pattern - Smaller classes or modules or sub functionalites inside one project.
                  There can be more than one design pattern in a project
 
1. Creational: Anything related to object creation
2. Behavior Design Pattern: How your objects are communicating/behaving with the app
3. Structural Design Pattern: How to assemble objects and classes into a large group or structure
 
 
1.Creational
 1. Singleton
 2. Factory Method / Factory Design Pattern
 3. Abstract Factory
 4. Builder Pattern
 5. Prototype
 
2. Behavioral
 1. Protocol Delegate
 2. Closures Design Pattern
 3. Observer Pattern
 4. Chain of responsibility
 5. Iterator
 
 
3. Structural
 1. Facade
 2. Decorator
 3. Adaptor
 
 */
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AuthManager.shared.doLogin(token: "123456")
    }

    
    @IBAction func testButtonTapped(_ sender: Any) {
        
        AuthManager.shared.logout()
        
        print("testButton tapped: \(AuthManager.shared.authToken)")
    }
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        
        print("changeButton tapped: \(AuthManager.shared.authToken)")
    }
}

