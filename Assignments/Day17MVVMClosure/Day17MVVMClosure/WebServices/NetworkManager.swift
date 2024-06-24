//
//  NetworkManager.swift
//  Day17MVVMClosure
//
//  Created by Ebillson Grand Jean on 6/14/24.
//

import Foundation


protocol DataTransfer: NSObject {
        
    func didReceiveEmployeeData(empData: EmployeeData)
    
    func didReceiveError(error: Error)
}


protocol NetworkableProtocol {
    
    func getDataFromAPIUsingCompletionHandler(url: URL, completion: @escaping(Result<[User], Error>) -> Void)
}

class NetworkManager: NetworkableProtocol {
    
    func getDataFromAPIUsingCompletionHandler(url: URL, completion: @escaping (Result<[User], any Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            
        }
    }
    
    
    func getDataFromAPIUsingProtocolDelegate(url: URL) {
        
    }
    
}
