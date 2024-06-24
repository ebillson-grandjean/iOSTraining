//
//  ContentView.swift
//  Day22Part1SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

/*
 Property Wrappers: They add extra meaning to variables making them mutable for struct/swiftUI
 
    1- @State: Should be used for simple data types like String, Int, Double, Float, Bool
 
    2- @Binding
    3- @StateObject
    4- @ObservedObject
    5- @Environment
    6- @EnvironmentObject
    7- @ObservableObject
    8- @AppStorage
    9- @Published
    10- @FetchRequest
 */

import SwiftUI

struct ContentView: View {
    
    @State var myData = "{Some data are passed yay!!!}"
    
    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Welcome to my SwiftUI App!")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                Text("iOS Training - Day 22")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
                
                Text("We are passing some data: \n\n" + myData)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 64)
                
               
                NavigationLink("Geometric Reader View"){
                    GeometricReaderView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
                
                NavigationLink("Split View"){
                    SplitView()
                }
                .frame(width: 300, height: 40)
                .background(Color(.cyan))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
                
                NavigationLink("Property Wrappers View"){
                    PropertyWrappersView(data: $myData)
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
    ContentView()
}
