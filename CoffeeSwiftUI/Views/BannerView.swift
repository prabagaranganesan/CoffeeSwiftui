//
//  BannerView.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 27/05/23.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("COFFEE DAY")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                Text(message1 + message2)
                    
                Text("Enjoy coffee with the latest variants and get discounts")
                    .font(.footnote)
                Button {
                    
                } label: {
                    Text("Get Discount")
                        .font(.system(size: 16, weight: .semibold))
                }
                .frame(width: 132, height: 37)
                .background(.white)
                .foregroundColor(.black)
                .cornerRadius(20)
                .padding([.bottom, .top], 12)
                
            }.padding([.leading, .top], 12)
            .foregroundColor(.white)
            Image("banner")
                .resizable()
        }
        .background(.black)
        .cornerRadius(16)
    }
    
    var message1: AttributedString {
        var result = AttributedString("OFF ")
        result.font = .system(size: 35, weight: .semibold)
        result.foregroundColor = .white
        return result
    }
    
    var message2: AttributedString {
        var result = AttributedString("30%")
        result.font = .system(size: 35, weight: .semibold)
        result.foregroundColor = .red
        return result
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
