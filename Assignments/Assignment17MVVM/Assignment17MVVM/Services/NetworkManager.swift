//
//  NetworkManager.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/17/24.
//

import Foundation


class NetworkManager:NetworkableProtocol {
    
    weak var delegate: DataTransferProtocol?
    
    func getDataFromAPIUsingProtocolDelegate(url: URL){
        
        let dataTask  = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                self.delegate?.didReceiveError(error: error)
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    self.delegate?.didReceiveError(error: NetworkError.httpResponseError(response.statusCode))
                    return
                }
            }
            
            
            guard let data = data else {
                self.delegate?.didReceiveError(error: NetworkError.dataNotFoundError)
                return
            }
            
            do {
                let parsedUserData = try JSONDecoder().decode(UserData.self, from: data)
                print(parsedUserData)
                self.delegate?.didReceiveData(userData: parsedUserData)
            }catch {
                self.delegate?.didReceiveError(error: error)
            }
            
        }
        
        dataTask.resume()
        
    }
    
    
    func getDataFromAPIUsingCompletion(url: URL, completion: @escaping(Result<UserData, any Error>) -> Void){
        
        let dataTask  = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    completion(.failure(NetworkError.httpResponseError(response.statusCode)))
                    return
                }
            }
            
            
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFoundError))
                return
            }
            
            do {
                let parsedUserData = try JSONDecoder().decode(UserData.self, from: data)
                completion(.success(parsedUserData))
            }catch {
                completion(.failure(error))
            }
            
        }
        
        dataTask.resume()
        
    }
    

}
