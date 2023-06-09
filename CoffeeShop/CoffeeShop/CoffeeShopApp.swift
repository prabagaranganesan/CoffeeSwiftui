//
//  CoffeeShopApp.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import SwiftUI

@main
struct CoffeeShopApp: App {
    let container = AppEnvironment.bootstrap().container
    var body: some Scene {
        WindowGroup {
            ContentView(container: container)
        }
    }
}
