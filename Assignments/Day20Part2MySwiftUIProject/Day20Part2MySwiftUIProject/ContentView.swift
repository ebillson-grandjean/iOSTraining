//
//  ContentView.swift
//  Day20Part2MySwiftUIProject
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                
                Text("Hello, world. This is Ebillson!")
                    .font(.headline)
                    .foregroundStyle(.tint)
            }
            
            HStack {
                Image(systemName: "pencil")
                    .font(.subheadline)
                    .foregroundStyle(.tint)
                    .padding()
                Text("I am learning SwiftUI")
                    .foregroundStyle(.tint)
            }.padding(32)
            
            Button("Login"){
                print("Button Login Tapped!")
            }
            
            Button(action: {
                print("Sign Up Button Tapped")
            }, label: {
                Text("Sign Up")
            })
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
