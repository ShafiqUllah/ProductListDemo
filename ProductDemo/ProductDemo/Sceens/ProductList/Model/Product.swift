//
//  Product.swift
//  ProductDemo
//
//  Created by test on 11/19/24.
//

import Foundation

struct Product: Codable, Hashable, Identifiable{
    var id : Int
    var title: String
    var price: Double
    var description: String
    var category : String
    var image : String
    var rating: Rating
    
}

struct Rating: Codable, Hashable{
    var rate: Double
    var count: Int
}
