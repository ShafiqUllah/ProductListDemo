//
//  ProductItemView.swift
//  ProductDemo
//
//  Created by test on 11/19/24.
//

import SwiftUI

struct ProductItemView: View {
    
    var product: Product
    
    var body: some View {
        HStack{
            // image
            //            Image(systemName: "globe")
            //                .frame(width: 100, height: 100)
            AsyncImage(url: URL(string: product.image)) { result in
                
                switch result {
                case .empty:
                    ProgressView()
                        .frame(width: 100, height: 100)
                case .success(let image):
                    image.resizable()
                        .frame(width: 100, height: 100)
                        .clipped()
                case .failure(let error):
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                    
                @unknown default:
                    EmptyView()
                }
                
            }
            
            
            VStack(alignment: .leading){
                //Name
                Text(product.title)
                    .font(.title)
                    .bold()
                
                HStack{
                    //Category
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    //rating
                    HStack{
                        Image(systemName: "star")
                        
                        Text(String(format: "%.1f", product.rating.rate))
                    }.foregroundStyle(.orange)
                }
                
                //description
                Text(product.description)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                HStack{
                    //Price
                    Text("$"+String(format: "%.2f", product.price))
                        .font(.title2)
                        .foregroundStyle(.blue)
                    
                    
                    Spacer()
                    
                    //buy button
                    Button {
                        // Action
                    } label: {
                        Text("Buy")
                    }.padding()
                    
                }
            }
        }.padding()
    }
}

#Preview {
    ProductItemView(product: Product(
        id: 1,
        title: "Wireless Mouse",
        price: 25.99,
        description: "A reliable wireless mouse with ergonomic design and long battery life.",
        category: "Electronics",
        image: "https://example.com/images/wireless-mouse.jpg",
        rating: Rating(rate: 4.5, count: 230)
    )
    )
}
