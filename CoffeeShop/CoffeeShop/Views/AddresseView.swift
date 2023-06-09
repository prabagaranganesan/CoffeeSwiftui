//
//  AddresseView.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 28/05/23.
//

import SwiftUI

struct AddresseView: View {
    
    
    var body: some View {
        HStack {
            Image("")
            VStack(alignment: .leading, spacing: 2) {
                Text("Yogykarta, Indonasia")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                Text("Jl. Jalanin dulu aja")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "bell")
                .padding(.trailing)
        }
    }
}

struct AddresseView_Previews: PreviewProvider {
    static var previews: some View {
        AddresseView()
    }
}

