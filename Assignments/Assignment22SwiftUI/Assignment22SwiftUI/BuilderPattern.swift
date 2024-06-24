//
//  BuilderPattern.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import Foundation


class User {
    
    var username = ""
    var email = ""
    var phone = ""
    
    func description() -> String {
        
        return "User with \(username), \(email) and \(phone) info"
    }
}

class UserBuilder {
    
    private var user = User()
    
    func setUsername(_ username: String) -> UserBuilder{
        user.username = username
        return self
    }
    
    
    func setEmail(_ email: String) -> UserBuilder{
        user.email = email
        return self
    }
    
    
    func setPhone(_ phone: String) -> UserBuilder{
        user.phone = phone
        return self
    }
    
    func buildUser() -> User {
        return user
    }
}
