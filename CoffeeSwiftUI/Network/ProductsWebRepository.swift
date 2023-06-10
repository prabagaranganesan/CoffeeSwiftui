//
//  ProductsWebRepository.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 02/06/23.
//

import Combine
import Foundation

protocol ProductsWebrepository: WebRepository {
    func loadProducts() -> AnyPublisher<ProductResponse, Error>
    func loadProductDetails(product: Product) -> AnyPublisher<Product.Details, Error>
}

struct RealProductsWebRepository: ProductsWebrepository {
    let session: URLSession
    let baseURL: String
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func loadProducts() -> AnyPublisher<ProductResponse, Error> {
        return call(endpoint: API.allProducts)
    }
    
    func loadProductDetails(product: Product) -> AnyPublisher<Product.Details, Error> {
        let request: AnyPublisher<[Product.Details], Error> = call(endpoint: API.productDetails(product))
        return request
            .tryMap { array -> Product.Details in
                guard let details = array.first
                else { throw APIError.unexpectedResponse }
                return details
            }
            .eraseToAnyPublisher()
    }
}
