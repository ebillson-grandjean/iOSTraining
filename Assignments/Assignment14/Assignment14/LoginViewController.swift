//
//  LoginViewController.swift
//  Assignment14
//
//  Created by Ebillson Grand Jean on 6/12/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonLoginClicked(_ sender: Any) {
        
        
        
        
        let emailID = textFieldEmail.text ?? ""
        
        let password = textFieldPassword.text ?? ""
        
//        if emailID.isEmpty && password.isEmpty {
//            print("Enter your email and password")
//            return
//        }
        
//        if emailID == "admin@mail.com" && password == "password" {
            

            performSegue(withIdentifier: "MenuViewControllerSegue", sender: sender)
//        }
        
//        print("Wrong email and password")
        return
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
