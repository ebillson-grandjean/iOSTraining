//
//  LoginViewModel.swift
//  Day15Part2MVC
//
//  Created by Ebillson Grand Jean on 6/13/24.
//

import Foundation


class LoginViewModel {
    
    func areCredentialsValid ( email: String, password: String) -> Bool {
        var areCredentialsValid = false
        
        if email.isEmpty {
            return areCredentialsValid
        }
        
        if password.isEmpty {
            return areCredentialsValid
        }
        
        let validPassword = password.count >= 6
        
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let validEmail = emailPredicate.evaluate(with: email)
        
        areCredentialsValid = validEmail && validPassword
        
        return areCredentialsValid
    }
    
}
