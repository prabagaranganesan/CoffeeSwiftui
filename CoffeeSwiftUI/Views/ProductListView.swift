//
//  ProductListView.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import SwiftUI

struct ProductListView: View {
    
    @State var products: Loadable<[Product]>
    @State private var productSearch = ProductSearch()
    @Environment(\.injected) var injected: DIContainer

    let columns = Array(repeating: GridItem(.flexible(), spacing: 16, alignment: .topLeading), count: 2)
    
    var body: some View {
        self.content
    }
    
    @ViewBuilder private var content: some View {
        switch products {
        case .notRequested:
            notRequestedView
        case let .isLoading(last, _):
            loadingView(last)
        case let .loaded(products):
            loadedView(products, showSearch: true, showLoading: false)
        case let .failed(error):
            Text("Error occured") //TODO: Show error alert
        }
    }
    
    var notRequestedView: some View {
        Text("").onAppear(perform: loadProducts)
    }
    
    func loadProducts() {
        injected.interacters.productsInteracter.load(products: $products, search: productSearch.searchText, locale: .current)
    }
    
    func loadingView(_ previoulyLoaded: [Product]?) -> some View {
        if let products = previoulyLoaded {
            return AnyView(loadedView(products, showSearch: false, showLoading: true))
        } else {
            return AnyView(ActivityIndicatorView().padding())
        }
    }
    
    func loadedView(_ products: [Product], showSearch: Bool, showLoading: Bool) -> some View {
        LazyVGrid(columns: columns, spacing: 16) {
           
            Group {
                Text("Popular")
                    .font(.system(size: 22, weight: .semibold))
                Text("")
            }
            .font(.title)
            ForEach(products) { product in
                ProductView(product: product)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(color: .gray, radius: 1, x: 0, y: 0)
                    )
            }
        }.id(products.count)
    }
}
