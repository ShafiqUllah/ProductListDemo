//
//  ProductViewModel.swift
//  ProductDemo
//
//  Created by test on 11/19/24.
//

import Foundation

class ProductViewModel: ObservableObject{
    @Published var products: [Product]?
    
    func getProducts(url:String) async throws-> [Product]{
        
        guard let url = URL(string: url) else{
            throw NetworkError.invalidURL
        }
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let status = response as? HTTPURLResponse , status.statusCode == 200  else{
            throw NetworkError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Product].self, from: data)
        }catch{
            NetworkError.invalidData
        }
        
        return  [
            Product(
                id: 1,
                title: "Wireless Mouse",
                price: 25.99,
                description: "A reliable wireless mouse with ergonomic design and long battery life.",
                category: "Electronics",
                image: "https://example.com/images/wireless-mouse.jpg",
                rating: Rating(rate: 4.5, count: 230)
            ),
            Product(
                id: 2,
                title: "Bluetooth Headphones",
                price: 59.99,
                description: "Comfortable over-ear headphones with excellent sound quality and noise cancellation.",
                category: "Electronics",
                image: "https://example.com/images/bluetooth-headphones.jpg",
                rating: Rating(rate: 4.7, count: 450)
            ),
            Product(
                id: 3,
                title: "Running Shoes",
                price: 89.99,
                description: "Lightweight running shoes with great cushioning and traction for all surfaces.",
                category: "Footwear",
                image: "https://example.com/images/running-shoes.jpg",
                rating: Rating(rate: 4.3, count: 120)
            ),
            Product(
                id: 4,
                title: "Coffee Maker",
                price: 49.99,
                description: "Compact and efficient coffee maker, perfect for brewing your morning cup.",
                category: "Home Appliances",
                image: "https://example.com/images/coffee-maker.jpg",
                rating: Rating(rate: 4.1, count: 80)
            ),
            Product(
                id: 5,
                title: "Desk Lamp",
                price: 19.99,
                description: "Adjustable desk lamp with a sleek design and bright LED lighting.",
                category: "Home Office",
                image: "https://example.com/images/desk-lamp.jpg",
                rating: Rating(rate: 4.6, count: 150)
            )
        ]
        

    }
}
