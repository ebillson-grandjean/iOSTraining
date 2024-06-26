//
//  PlanetDetailsView.swift
//  Assignment24SwiftUIMVVMSwapiPlanets
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import SwiftUI

struct PlanetDetailsView: View {
    var planet: Planet
    
    var body: some View {
        ScrollView{
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 320)
                    .padding(.bottom, 24)
                
                HStack(alignment: .center){
                    
                    Text("Planet Name: ")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Text(planet.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                .padding(.bottom, 16)
                
                
                VStack(alignment: .leading, spacing: 10){
                    
                    HStack{
                        Text("Rotation Period: ")
                            .font(.title3)
                            .bold()
                        Text(planet.rotationPeriod)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    
                    
                    HStack{
                        Text("Orbital Period: ")
                            .font(.title3)
                            .bold()
                        Text(planet.orbitalPeriod)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    
                    
                    HStack{
                        Text("Diameter: ")
                            .font(.title3)
                            .bold()
                        Text(planet.diameter)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    
                    HStack{
                        Text("Climate: ")
                            .font(.title3)
                            .bold()
                        Text(planet.climate)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    
                    HStack{
                        Text("Gravity: ")
                            .font(.title3)
                            .bold()
                        Text(planet.gravity)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    
                    
                    HStack{
                        Text("Terrain: ")
                            .font(.title3)
                            .bold()
                        Text(planet.surfaceWater)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    
                    
                    HStack{
                        Text("Population: ")
                            .font(.title3)
                            .bold()
                        
                        Text(planet.population)
                            .font(.title3)
                            .foregroundStyle(.gray)
                        Text(" inhabitants")
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    
                    
                    HStack{
                        Text("Residents: ")
                            .font(.title3)
                            .bold()
                        
                        List(planet.residents, id: \.self){ resident in
                            
                            Text(resident)
                            .font(.title3)
                            .foregroundStyle(.gray)
                        }
                        .frame(height: 64 * CGFloat((planet.residents.count)))
                            
                    }
                    
                    
                    HStack{
                        
                        Text("Films: ")
                            .font(.title3)
                            .bold()
                        
                        List(planet.films, id: \.self){ film in
                            Text(film)
                            .font(.title3)
                            .foregroundStyle(.gray)
                        }
                        .frame(height: 64 * CGFloat((planet.films.count)))
                    }
                    
                    HStack{
                        Text("Creation: ")
                            .font(.title3)
                            .bold()
                        
                        Text(planet.created)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    HStack{
                        Text("Edtion: ")
                            .font(.title3)
                            .bold()
                        
                        Text(planet.edited)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                    HStack{
                        Text("Website: ")
                            .font(.title3)
                            .bold()
                        
                        Text(planet.url)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    }
                    
                }
                .padding(.leading, 2)
                .padding(.trailing, 2)
            }
        }
    }
}

#Preview {
    PlanetDetailsView(planet: Planet(name: "Ebillson's Planet", rotationPeriod: "Default Rotation Period", orbitalPeriod: "Default Orbital Period", diameter: "Default Diameter", climate: "Default Climate", gravity: "Default Gravity", terrain: "Default Gravity", surfaceWater: "Default Surface Water", population: "1 000 000", residents: ["Ebillsonians", "Billsonians"], films: ["The Invasion"], created: "01.01.01", edited: "01.01.01", url: "https://ebillsonians.com"))
}
