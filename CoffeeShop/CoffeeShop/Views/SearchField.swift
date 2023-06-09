//
//  Searchfield.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import SwiftUI

struct SearchField: View {
    var body: some View {
        HStack() {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.leading, 16)
            Button {
                
            } label: {
                Text("Search coffee favorite")
            }.foregroundColor(.gray)
                .frame(height: 50)
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.white)
                .shadow(color: .gray, radius: 1, x: 0, y: 0)
        )
    }
}

struct Searchfield_Previews: PreviewProvider {
    static var previews: some View {
        SearchField()
    }
}
