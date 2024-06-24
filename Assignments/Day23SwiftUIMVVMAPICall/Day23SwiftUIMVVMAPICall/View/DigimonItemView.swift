//
//  DigimonItemView.swift
//  Day23SwiftUIMVVMAPICall
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import SwiftUI

struct DigimonItemView: View {
    var digimon: Digimon
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: digimon.img)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
            } placeholder : {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            .padding(.trailing, 16)
            
            VStack(alignment: .leading) {
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
    DigimonItemView(digimon: Digimon(name: "EbillMon", img: "https://digimon.shadowsmith.com/img/koromon.jpg", level: "In Training"))
}
