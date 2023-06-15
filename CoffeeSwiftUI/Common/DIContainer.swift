//
//  DIContainer.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 06/06/23.
//

import Foundation
import Combine
import SwiftUI

struct DIContainer: EnvironmentKey {
    static var defaultValue: Self { Self.default }
    let interacters: Interacters
    
    init(interactors: Interacters) {
        self.interacters = interactors
    }
    
    private static let `default` = Self(interactors: .stub)
    
}

extension DIContainer {
    struct Interacters {
        let productsInteracter: ProductsInteractor
        
        init(productsInteracter: ProductsInteractor) {
            self.productsInteracter = productsInteracter
        }
        
        static var stub: Self {
            .init(productsInteracter: StubProductInteractor())
        }
    }
}

struct StubProductInteractor: ProductsInteractor {
    
    func load(products: LoadableSubject<[Product]>, search: String, locale: Locale) {
        //TODO: add mock logic
    }
    
    func load(productDetails: LoadableSubject<Product.Details>, product: Product) {
        //TODO: add mock logic
    }
}
