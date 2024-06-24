//
//  IPManager.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import Foundation

// Singleton Pattern

final class IPManager {
    
    static let sharedIP = IPManager()
    
    private init(){}
    
    var IPAddress = ""
    
    func setIPAddress(address: String){
        self.IPAddress = address
    }
    
    func setDefaultIP(){
        self.IPAddress = "0.0.0.0"
    }
}
