//
//  Network.swift
//  projectInterview
//
//  Created by Lucinda Flores on 29/08/2023.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    
    func fetchProducts() async throws  -> [Products] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw ProductError.invalidURL
        }

        var products = [Products]()
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedData = try JSONDecoder().decode(ProductsModel.self, from: data)
            products = decodedData.products
        } catch {
            print(error)
            throw ProductError.invalidData
        }
        return products
    }

     
}

