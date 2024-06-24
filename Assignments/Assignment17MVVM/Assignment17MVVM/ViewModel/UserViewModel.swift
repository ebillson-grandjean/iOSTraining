//
//  UserViewModel.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/17/24.
//

import Foundation


class UserViewModel: NSObject {
    
    let networkManager = NetworkManager()
    var users = [User]()
    var refreshViewClosure: (()-> Void)?
    
    func getUsersData(completion: @escaping () -> ()){
        
        guard let url = URL(string: APIConstants.UsersEndpoint) else { return }
                
        networkManager.getDataFromAPIUsingCompletion(url: url) { [weak self] result in
            switch result {
                case .success(let userData):
                    self?.users = userData.data
                    completion()
                case.failure(let error):
                    print(error.localizedDescription)
                    completion()
            }
            
        }
    }
    
    
    func getUsersDataWithProtocolDelegate(){
        
        guard let url = URL(string: APIConstants.UsersEndpoint) else {
            print("Wrong URL")
            return
        }
    
        networkManager.delegate = self
        networkManager.getDataFromAPIUsingProtocolDelegate(url: url)
    }
}


extension UserViewModel: DataTransferProtocol {
    
    func didReceiveData(userData: UserData) {
        self.users = userData.data
        refreshViewClosure?()
    }
    
    func didReceiveError(error: any Error) {
        print(error.localizedDescription)
    }
}
