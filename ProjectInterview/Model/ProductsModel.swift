//
//  Products.swift
//  projectInterview
//
//  Created by Lucinda Flores on 29/08/2023.
//

import Foundation

struct ProductsModel: Codable {
    var products: [Products]
}
  
struct Products: Codable, Identifiable {
    var id: Int
    var title: String
    var description : String
    var price: Int
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
}



struct MockData {
    static let sampleProduct = ProductsModel(products: [product1, product1, product1])
    

    static let product1 = Products(id: 001,
                                   title: "test product",
                                   description: "test desc",
                                   price: 90,
                                   discountPercentage: 10.0,
                                   rating: 9.9,
                                   stock: 100,
                                   brand: "Test brand",
                                   category: "Test cat",
                                   thumbnail: "https://i.dummyjson.com/data/products/4/thumbnail.jpg",
                                   images:["https://i.dummyjson.com/data/products/4/1.jpg",
                                           "https://i.dummyjson.com/data/products/4/2.jpg",
                                           "https://i.dummyjson.com/data/products/4/3.jpg"])
}
