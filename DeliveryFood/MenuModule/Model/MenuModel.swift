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
    }
}

struct Meal: Codable {
    let id: Int
    let category: String
    let name: String
    let description: String
    let price: Int
    let imageURL: String
}
