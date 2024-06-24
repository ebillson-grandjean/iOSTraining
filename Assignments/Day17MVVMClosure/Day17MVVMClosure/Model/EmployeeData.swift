//
//  EmployeeData.swift
//  Day17MVVMClosure
//
//  Created by Ebillson Grand Jean on 6/14/24.
//

import Foundation

struct EmployeeData: Decodable {
    
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [Employee]
    let support: Support
    
    enum CodingKeys: String,CodingKeys {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case totalPages = "total_pages"
    }
}


struct Employee: Decodable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    
    enum CodingKeys: String, CodingKeys {
        
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
}


struct Support: Decodable {
    
    let url: String
    let text: String
    
}
