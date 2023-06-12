//
//  ApiEndpoint.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 10/06/23.
//

import Foundation

extension RealProductsWebRepository {
    enum API {
        case allProducts
        case productDetails(Product)
    }
}

extension RealProductsWebRepository.API: APICall {
    var path: String {
        switch self {
        case .allProducts:
            return "/v1/products/coffee"
        case let .productDetails(product):
            let encodedName = product.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return "/name/\(encodedName ?? product.name)"
        }
    }
    
    var method: String {
        switch self {
        case .allProducts, .productDetails:
            return "GET"
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
    
    func body() throws -> Data? {
        return nil
    }
}
