//
//  PlanetItemView.swift
//  Assignment24SwiftUIMVVMSwapiPlanets
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import SwiftUI

struct PlanetItemView: View {
    var planet: Planet
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(planet.name)
                .font(.title2)
                .bold()
                .padding(.leading, 2)
                .padding(.bottom, 4)
            HStack {
                
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 72, height: 72)
                    .padding(.leading, 2)
                    .padding(.trailing, 2)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Climate: ")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.black)
                        Text(planet.climate)
                            .font(.title3)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.trailing, 2)
                    
                    HStack {
                        Text(planet.population)
                            .font(.title3)
                            .foregroundStyle(.gray)
                        Text(" inhabitants")
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing, 2)
                }
            }
            
        }
        
    }
}

#Preview {
    PlanetItemView(planet: Planet(name: "Ebillson's Planet", rotationPeriod: "Default Rotation Period", orbitalPeriod: "Default Orbital Period", diameter: "Default Diameter", climate: "Default Climate", gravity: "Default Gravity", terrain: "Default Gravity", surfaceWater: "Default Surface Water", population: "1 000 000", residents: ["Ebillsonians", "Billsonians"], films: ["The Invasion"], created: "01.01.01", edited: "01.01.01", url: "https://ebillsonians.com"))
}

