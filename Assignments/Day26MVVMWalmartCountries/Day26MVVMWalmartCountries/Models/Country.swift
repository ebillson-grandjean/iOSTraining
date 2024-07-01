//
//  Country.swift
//  Day26MVVMWalmartCountries
//
//  Created by Ebillson Grand Jean on 6/27/24.
//

import Foundation


struct Country: Codable {
    let capital, code: String
    let currency: Currency
    let flag: String
    let language: Language
    let name: String
    let region: String
//    let region: Region
    let demonym: String?
    
}

struct Currency: Codable {
    let code, name: String
    let symbol: String?
}

struct Language: Codable {
    let code: String?
    let name: String
    let iso6392, nativeName: String?

    enum CodingKeys: String, CodingKey {
        case code, name
        case iso6392 = "iso_6392"
        case nativeName = "native_name"
    }
}

enum Region: String, Codable {
    case af = "AF"
    case americas = "Americas"
    case an = "AN"
    case empty = ""
    case eu = "EU"
    case na = "NA"
    case oc = "OC"
    case regionAS = "AS"
    case sa = "SA"
}

