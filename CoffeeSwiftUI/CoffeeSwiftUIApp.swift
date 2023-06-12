//
//  CoffeeSwiftUIApp.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import SwiftUI

@main
struct CoffeeSwiftUIApp: App {
    let container = AppEnvironment.bootstrap().container
    var body: some Scene {
        WindowGroup {
            ContentView(container: container)
        }
    }
}
