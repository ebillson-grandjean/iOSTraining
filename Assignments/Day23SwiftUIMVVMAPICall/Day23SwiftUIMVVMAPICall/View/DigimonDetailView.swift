//
//  DigimonDetailView.swift
//  Day23SwiftUIMVVMAPICall
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct DigimonDetailView: View {
    var digimon: Digimon
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: digimon.img)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 320)
            } placeholder : {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            .padding()
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text(digimon.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Text(digimon.level)
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    DigimonDetailView(digimon: Digimon(name: "EbillMon", img: "https://digimon.shadowsmith.com/img/koromon.jpg", level: "In Training"))
}
