//
//  UIUpdate.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/17/24.
//

import Foundation


protocol DataTransferProtocol: NSObject {
    func didReceiveData(userData: UserData)
    func didReceiveError(error: Error)
}
