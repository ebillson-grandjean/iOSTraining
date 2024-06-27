//
//  ProductItemView.swift
//  Assignment25CoreDataProducts
//
//  Created by Ebillson Grand Jean on 6/26/24.
//

import SwiftUI

struct ProductItemView: View {
    var product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
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
                Text(product.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Text("Price: $\(String(format: "%.2f", product.price))")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
        }
        
    }
}

#Preview {
    ProductItemView(product: Product(id: 1, title: "Essence Mascara Lash Princess", description: "The Essence Mascara Lash Princess is a popular mascara", category: "beauty", price: 15.99, discountPercentage: 3.00, rating: 4.94, stock: 12, tags: ["beauty", "mascara"], brand: "Essence", thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"))
}
