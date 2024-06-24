//
//  Digimon.swift
//  Day23SwiftUIMVVMAPICall
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import Foundation


// MARK: - DigimonElement
struct Digimon: Decodable {
    let name: String
    let img: String
    let level: String
}

enum Level: String, Codable {
    case armor = "Armor"
    case champion = "Champion"
    case fresh = "Fresh"
    case inTraining = "In Training"
    case mega = "Mega"
    case rookie = "Rookie"
    case training = "Training"
    case ultimate = "Ultimate"
}


extension Digimon: Identifiable {
    var id: UUID {
        return UUID()
    }
}


