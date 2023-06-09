//
//  Banner.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 29/05/23.
//

import Foundation

struct Banner: Codable {
    let templateKey: String
    let information: Information
}

struct HeaderData {
    let address: Address
    let banners: [Banner]
}

struct Address: Codable {
    let title: String
    let description: String
    let image: String
}

struct Information: Codable {
    let offer: String
    let offerDescription: String
    let image: String
    let titleDescription: String
    let cta: CTA?
}

struct CTA: Codable {
    let title: String
    let image: String?
    let action: CTAAction
}

enum CTAAction: Codable {
    case deeplink
    case showCard
}
