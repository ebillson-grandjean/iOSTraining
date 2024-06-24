//
//  AdapterPattern.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import Foundation


protocol USBPortComputer {
    
    func supportUSBDrives()
}



class AppleComputer: USBPortComputer {
    
    private var hasConnector: Bool
    
    init(hasConnector: Bool) {
        self.hasConnector = hasConnector
    }
    
    func supportUSBDrives() {
        hasConnector = true
        if hasConnector {
            print("USB Connector Plugged")
        } else {
            print("Plug your USB Connector First!")
        }
            
    }
}


class TypeCToUSBAdapter: USBPortComputer {
 
    
    private var appleComputer: AppleComputer
    
    init(appleComputer: AppleComputer) {
        self.appleComputer = appleComputer
    }
    
    
    func supportUSBDrives() {
        print("Type C to USB Converter plugged!")
    }
    
}


class Adapter {
    
    func connectTypeCToUSBAdapter(appleComputer: AppleComputer) {
        appleComputer.supportUSBDrives()
    }
    
}
