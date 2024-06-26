//
//  Place.swift
//  Day23SwiftUIAppleMap
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import Foundation
import CoreLocation

struct Place: Identifiable {
    
    var name: String
    var coordinates: CLLocationCoordinate2D
    var id = UUID()
    
    
}
