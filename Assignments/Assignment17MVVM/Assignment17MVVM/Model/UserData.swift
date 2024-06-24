//
//  User.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/16/24.
//

import Foundation

struct UserData:Decodable {
    
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [User]
    let support: Support
    
    enum CodingKeys:String, CodingKey {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case totalPages = "total_pages"
        case data = "data"
        case support = "support"
    }
    
}



struct User:Decodable {
    
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    
    enum CodingKeys:String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
}


struct Support:Decodable {
    let url: String
    let text: String
}
