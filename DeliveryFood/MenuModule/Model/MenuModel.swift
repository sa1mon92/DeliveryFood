//
//  MenuModel.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import Foundation

struct MenuModel: Codable {
    let topSales: [TopSale]
    let meals: [Meal]
    
    struct TopSale: Codable {
        let id: Int
        let imageURL: String
        
        init?(id: Int?, imageURL: String?) {
            guard let id = id,
                  let imageURL = imageURL
            else { return nil }
            
            self.id = id
            self.imageURL = imageURL
        }
    }
}

struct Meal: Codable {
    let id: Int
    let category: String
    let name: String
    let description: String
    let price: Int
    let imageURL: String
    
    init?(id: Int?, category: String?, name: String?, description: String?, price: Int?, imageURL: String?) {
        guard let id = id,
           let category = category,
           let name = name,
           let description = description,
           let price = price,
           let imageURL = imageURL
        else { return nil }
        
        self.id = id
        self.category = category
        self.name = name
        self.description = description
        self.price = price
        self.imageURL = imageURL
    }
}
