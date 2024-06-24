//
//  FacadeDesignPattern.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import Foundation


protocol CPU {
    func freeze()
    func exectute()
}


protocol Hardrive {
    
    func read(size: Int)
}



protocol Memory {
    func loadMemory()
}


class RAMMemory: Memory {
    func loadMemory() {
        print("RAM Memory Loading...")
    }
}


class IntelCPU: CPU {
    func freeze(){
        print("Intel CPU freezes :(")
    }
    
    func exectute(){
        print("Intel CPU executes some tasks...")
    }
}


class AMDCPU: CPU {
    func freeze(){
        print("AMD CPU freezes :(")
    }
    
    func exectute(){
        print("AMD CPU executes some tasks...")
    }
}


class SeagateInternalHardrive: Hardrive {
    func read(size: Int) {
        print("Seagate Hard Drive reading data, the disk size is \(size) GB...")
    }
}

class ComputerFacade {
    
    private var intelCPU = IntelCPU()
    private var ramMemory = RAMMemory()
    private var harDrive = SeagateInternalHardrive()
    
    func start() {
        intelCPU.freeze()
        ramMemory.loadMemory()
        intelCPU.exectute()
    }
}


