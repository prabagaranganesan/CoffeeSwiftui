//
//  AppEnvironment.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 06/06/23.
//

import Foundation

struct AppEnvironment {
    let container: DIContainer
    
    static func bootstrap() -> AppEnvironment {
        let session = configURLSession()
        let webRepositoris = configureWebRepositories(session: session)
        let interactors = configuredInteracters(webRepositories: webRepositoris)
        let diContainer = DIContainer(interactors: interactors)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
    
    private static func configureWebRepositories(session: URLSession) -> DIContainer.WebRepositories {
        let productRepository = RealProductsWebRepository(session: session, baseURL: "http://demo9983835.mockable.io/")
        return .init(productRespository: productRepository)
    }
    
    private static func configuredInteracters(webRepositories: DIContainer.WebRepositories) -> DIContainer.Interacters {
        let productInteractres = RealProductInteractor(webRepository: webRepositories.productRespository)
        return .init(productsInteracter: productInteractres)
    }
}

extension DIContainer {
    struct WebRepositories {
        let productRespository: ProductsWebrepository
    }
}
