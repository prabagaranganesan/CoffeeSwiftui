//
//  ProductView.swift
//  CoffeeShop
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import SwiftUI

struct ProductView: View {
   @State var product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(product.imageURL)
                .resizable()
            Text(product.name)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
                .padding(.leading, 5)
            Text(product.description)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
                .padding(.leading, 5)
            HStack(alignment: .bottom) {
                HStack() {
                    Text(product.priceAmount)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                    if let amount = product.discountAmount {
                        Text(amount)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(red: 35 / 255, green: 187 / 255, blue: 139 / 255))
                            .padding(.leading, 8)
                    }
                }.padding([.leading, .bottom], 8)

               Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .frame(width: 45, height: 45)
                }.background(.black)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding([.leading, .top], 0)
            }
            
        }.padding(.top, 0)
    }
}

//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView(product: product1)
//    }
//}
//
