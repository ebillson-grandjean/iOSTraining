//
//  MenuView.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Welcome to my SwiftUI App!")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 64)
                
                NavigationLink("Singleton Pattern"){
                    SingletonPatternView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
                
                
                NavigationLink("Factory Design Pattern View"){
                    FactoryDesignPatternView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
                
                
                NavigationLink("Facade Design Pattern View"){
                    FacadeDesignPatternView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
                
                
                NavigationLink("Adapter Pattern View"){
                    AdapterPatternView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
                
                NavigationLink("Observer Pattern View"){
                    ObserverPatternView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
             
                NavigationLink("Property Wrappers View"){
                    PropertyWrappersView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
            }
            .padding()
        }
    }
}

#Preview {
    MenuView()
}
