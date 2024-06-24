//
//  ListViewModel.swift
//  Day15Part2MVC
//
//  Created by Ebillson Grand Jean on 6/13/24.
//

import Foundation



class ListViewModel {
    
    var usersList = [User] ()
    var productsList = [Product] ()
    
    weak var myDelegate:UpdateUIProtocol?
    
    func readDataFromJSONFile () {
        let bundle = Bundle(for: ListViewController.self)
        let url = bundle.url(forResource: "ProductData", withExtension: "json")
        
        guard let url = url else { return }
        
        do {
            let fileData = try Data(contentsOf: url)
            let parsedList = try JSONDecoder().decode([Product].self, from: fileData)
            print(parsedList)
            productsList = parsedList
            myDelegate?.refresh()
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
