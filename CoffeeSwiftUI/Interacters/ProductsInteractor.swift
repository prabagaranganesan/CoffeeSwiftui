//
//  ProductsInteractor.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 29/05/23.
//

import Combine
import Foundation

protocol ProductsInteractor {
    func load(products: LoadableSubject<[Product]>, search: String, locale: Locale)
    func load(productDetails: LoadableSubject<Product.Details>, product: Product)
}


struct RealProductInteractor: ProductsInteractor {
    private let webRepository: ProductsWebrepository
    
    init(webRepository: ProductsWebrepository) {
        self.webRepository = webRepository
    }
    
    func load(products: LoadableSubject<[Product]>, search: String, locale: Locale) {
        let cancelBag = CancelBag()
        products.wrappedValue.setIsLoading(cancelBag: cancelBag)
        
        Just<Void>
            .withErrorType(Error.self)
            .flatMap { [webRepository] _ -> AnyPublisher<[Product], Error> in
                return webRepository.loadProducts()
                    .ensureTimeSpan(requestHoldBackTimeInterval)
                    .map { response in
                        return response.products
                    }
                    .eraseToAnyPublisher()
            }.print().sinkToLoadable { products.wrappedValue = $0 }
           .store(in: cancelBag)
    }
    
    func load(productDetails: LoadableSubject<Product.Details>, product: Product) {
        //TODO: implement for details screen
    }
    
    private var requestHoldBackTimeInterval: TimeInterval {
        return ProcessInfo.processInfo.isRunningTests ? 0 : 0.5
    }
}

extension Just where Output == Void {
    static func withErrorType<E>(_ errorType: E.Type) -> AnyPublisher<Void, E> {
        return withErrorType((), E.self)
    }
    
    static func withErrorType<E>(_ value: Output, _ errorTyoe: E.Type) -> AnyPublisher<Output, E> {
        return Just(value)
            .setFailureType(to: E.self)
            .eraseToAnyPublisher()
    }
}
