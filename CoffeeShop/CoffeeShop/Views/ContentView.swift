//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import SwiftUI

struct ContentView: View {
    private let container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    
    var body: some View {
        TabView() {
            HomeScreenView(text: "")
                .inject(container)
                .tabItem({
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                })
                .tag(Tab.Home)
            Text("Liked")
                .tabItem({
                    VStack {
                        Image(systemName: "heart")
                        Text("Liked")
                    }
                }).tag(Tab.liked)
            Text("Order")
                .tabItem({
                    VStack {
                        Image(systemName: "cart")
                        Text("Order")
                    }
                }).tag(Tab.order)
            Text("Profile")
                .tabItem({
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }).tag(Tab.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: .defaultValue)
    }
}

private enum Tab: Int, Hashable {
    case Home
    case liked
    case order
    case profile
}
