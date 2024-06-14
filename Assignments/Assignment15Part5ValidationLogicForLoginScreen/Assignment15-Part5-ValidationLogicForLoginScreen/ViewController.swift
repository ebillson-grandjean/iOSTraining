//
//  ViewController.swift
//  Assignment15-Part5-ValidationLogicForLoginScreen
//
//  Created by Ebillson Grand Jean on 6/12/24.
//


/*
 Assignment 15 - part 5
 5. Add a validation-logic for login screen

 */
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
   
    @IBOutlet weak var buttonLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    func areCredentialsValid ( email: String, password: String) -> Bool {
        var areCredentialsValid = false
        
        if email.isEmpty || password.isEmpty {
            return areCredentialsValid
        }
        
        let validPassword = password.count >= 6
        
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let validEmail = emailPredicate.evaluate(with: email)
        
        areCredentialsValid = validEmail && validPassword
        
        return areCredentialsValid
    }

    @IBAction func login(_ sender: Any) {
        
        let email = textFieldEmail.text ?? ""
        let password = textFieldPassword.text ?? ""
        
        if areCredentialsValid(email: email, password: password){
            performSegue(withIdentifier: "OtherViewSegue", sender: sender)
        }else {
            print("Invalid Credentials")
            return
        }
    }
    
    
}

