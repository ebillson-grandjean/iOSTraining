//
//  Singleton.swift
//  Day19-2-DesignPatterns
//
//  Created by Ebillson Grand Jean on 6/18/24.
//

import Foundation
/*
 
 
 
 
 Advantages
    Global Access
    One Single Object
    Saves Memory
    Easy to implement
 
 Disadvantages
    1. Global state
    2. Testing is difficult
    3. Tight Coupling of code
    4. Thread Safety
 */

final class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    
    private var isLoggedIn = false
    var authToken = ""
    
    
    func doLogin(token: String){
        isLoggedIn = true
        authToken = token
    }
    
    func logout(){
        isLoggedIn = false
        authToken = ""
    }
    
    
}
