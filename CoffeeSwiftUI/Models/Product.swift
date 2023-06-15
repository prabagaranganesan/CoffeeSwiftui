//
//  Product.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [Product]
}

struct Product: Hashable, Decodable, Identifiable {
    var id: String
    let name: String
    let description: String
    let price: Double
    let discount: Int?
    let imageURL: String
    
    var discountAmount: String? {
        guard let discount = discount else { return nil }
        return "-\(discount)%"
    }
    
    var priceAmount: String {
        return "$\(price)"
    }
}

extension Product {
    struct Details: Hashable, Decodable {
        let name: String
        let description: String
        let price: Double
        let discount: Int?
        let imageURL: String
    }
}
