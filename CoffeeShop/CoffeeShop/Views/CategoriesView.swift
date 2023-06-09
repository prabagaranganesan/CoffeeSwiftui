//
//  CategoriesView.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 28/05/23.
//

import SwiftUI

struct CategoriesView: View {
    let columen = GridItem(.flexible(), spacing: 16, alignment: .topLeading)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [columen], spacing: 16) {
                ForEach(categoriesList) { category in
                    VStack {
                        Image(category.image)
                        Text(category.title)
                            .font(.caption)
                    }
                    .frame(width: 70, height: 90)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.white)
                            .shadow(color: .gray, radius: 1, x: 0, y: 0)
                    )
                    .padding([.leading, .trailing], 2)
                    .padding(.top)
                    
                }
            }
        }
    }
}
 
struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}

