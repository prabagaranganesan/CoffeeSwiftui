//
//  ProductsWebRepository.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 02/06/23.
//

import Combine
import Foundation

protocol WebRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension WebRepository {
    func call<Value>(endpoint: APICall, httpCodes: HTTPCodes = .success) -> AnyPublisher<Value, Error> where Value: Decodable {
        do {
            let request = try endpoint.urlRequest(baseURL: baseURL)
            return session.dataTaskPublisher(for: request)
                .requestJSON(httpCodes: httpCodes)
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
}

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

private extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func requestJSON<Value>(httpCodes: HTTPCodes) -> AnyPublisher<Value, Error> where Value: Decodable {
        return requestData(httpCodes: httpCodes)
            .decode(type: Value.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

private extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func requestData(httpCodes: HTTPCodes = .success) -> AnyPublisher<Data, Error> {
        return tryMap {
            assert(!Thread.isMainThread)
            guard let code = ($0.1 as? HTTPURLResponse)?.statusCode else {
                throw APIError.unexpectedResponse
            }
            guard httpCodes.contains(code) else {
                throw APIError.httpCode(code)
            }
            return $0.0
        }
        .extractUnderlyingError()
        .eraseToAnyPublisher()
    }
}

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
            return "v1/products?type=coffee"
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

