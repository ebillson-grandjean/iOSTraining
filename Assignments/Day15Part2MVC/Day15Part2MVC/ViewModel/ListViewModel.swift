//
//  ListViewModel.swift
//  Day15Part2MVC
//
//  Created by Ebillson Grand Jean on 6/13/24.
//

import Foundation



class ListViewModel {
    
    var usersList = [User] ()
    weak var myDelegate:UpdateUIProtocol?
    
    func readDataFromJSONFile () {
        let bundle = Bundle(for: ListViewController.self)
        let url = bundle.url(forResource: "UserData", withExtension: "json")
        
        guard let url = url else { return }
        
        do {
            let fileData = try Data(contentsOf: url)
            let parsedList = try JSONDecoder().decode([User].self, from: fileData)
            print(parsedList)
            usersList = parsedList
            myDelegate?.refresh()
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
