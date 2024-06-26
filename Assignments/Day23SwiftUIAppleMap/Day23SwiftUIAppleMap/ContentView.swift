//
//  ContentView.swift
//  Day23SwiftUIAppleMap
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI
import MapKit
//import

struct ContentView: View {
    @State var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.27), span: MKCoordinateSpan(latitudeDelta:0.1, longitudeDelta: 0.1))
    
    @StateObject var myLocationManager = LocationManager()
    
    
    var somePlace = Place(name: "London", coordinates: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.27))
    
    var dynamicRegion: Binding<MKCoordinateRegion>? {
        guard let location = myLocationManager.currentLocation else {
            return MKCoordinateRegion.DummyDataRegion().getBindings()
        }
        
        let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        return region.getBindings()
    }
    
    
    var body: some View {
        VStack{
            // Static Region
//            Map(coordinateRegion: $staticRegion)
            
//            if let currentRegion = dynamicRegion {
//                
//                Map(coordinateRegion: currentRegion)
//            }
            
            
            if let currentRegion = dynamicRegion {
                
//                Map(coordinateRegion: currentRegion, annotationItems: [somePlace]) { place in
//                    
//                    // Simple Marker
//                    MapMarker(coordinate: place.coordinates)
//                    
//                }
                // Day 24
                Map{
                    Marker(somePlace.name, coordinate: somePlace.coordinates)
                        .tint(.orange)
                }.mapStyle(.standard)
//                {
                    
//                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
