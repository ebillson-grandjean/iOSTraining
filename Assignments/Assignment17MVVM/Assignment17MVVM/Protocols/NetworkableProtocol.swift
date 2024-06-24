//
//  NetworkableProtocol.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/18/24.
//

import Foundation


protocol NetworkableProtocol {
    
    func getDataFromAPIUsingCompletion(url: URL, completion: @escaping(Result<UserData, Error>) -> Void)
}
