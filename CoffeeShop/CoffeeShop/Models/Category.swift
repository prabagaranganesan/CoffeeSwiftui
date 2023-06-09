//
//  Category.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 28/05/23.
//

import Foundation

struct Category: Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let image: String
    var isSelected: Bool
}
