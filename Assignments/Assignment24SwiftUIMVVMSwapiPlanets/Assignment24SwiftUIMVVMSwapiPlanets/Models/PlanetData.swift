//
//  PlanetData.swift
//  Assignment24SwiftUIMVVMSwapiPlanets
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import Foundation


// MARK: - PlanetData
struct PlanetData: Codable {
    let count: Int
    let next: String
    let previous:String!
//    let previous: JSONNull?
    let results: [Planet]
}

// MARK: - Result
struct Planet: Codable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}


extension Planet: Identifiable {
    var id : UUID {
        UUID()
    }
}
