//
//  LoginViewModel.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import Foundation



class LoginViewModel: ObservableObject {
    
//    @Published var areCredentialsValid = false
    var areCredentialsValid = false
    
    func areCredentialsValid ( email: String, password: String) -> Bool {
        
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

