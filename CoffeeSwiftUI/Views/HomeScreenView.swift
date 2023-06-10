//
//  HomeScreenView.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import Combine
import SwiftUI

struct HomeScreenView: View {
    @State var text: String = ""
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
            NavigationView {
                VStack {
                    ScrollView(showsIndicators: false) {
                        AddresseView()
                        BannerView()
                            .padding(.bottom, 16)
                        SearchField()
                            .padding([.leading, .trailing], 8)
                        CategoriesView()
                            .frame(height: 110)
                        ProductListView(products: .notRequested)
                            .inject(injected)
                    }
                }.padding([.leading, .trailing], 10)
            }
    }
}

struct DrawingPaths: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 300))
            path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
            path.addLine(to: CGPoint(x: 450, y: 0))
        }
        .fill(.blue)
        .edgesIgnoringSafeArea(.top)
    }
}
