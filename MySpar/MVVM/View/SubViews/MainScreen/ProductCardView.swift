//
//  ProductCardView.swift
//  MySpar
//
//  Created by Александра Маслова on 15.08.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCardView: View {
    @State private var isImageLoaded = false
    var product: Product
    var body: some View {
        ZStack {
            Color.background
            ZStack {
              image
                if isImageLoaded{
                    VStack {
                        information
                        Spacer()
                        discount
                        purchasePanel
                    }
                }
                
            }
        }
        .cornerRadius(8)
        .padding(3)
        .frame(width: 132, height: 172)
        .shadow(color: .shadow, radius: 4)
        .onAppear{ loadImage() }
    }
    var image: some View {
        VStack {
            let url = URL(string: product.image)
            if #available(iOS 15.0, *) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: { ProgressView().frame(width: 132, height: 142) }
            } else {
                WebImage(url: url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
            }
            Spacer()
        }
    }
    @ViewBuilder
    var information: some View {
        if let inf = product.inf {
            HStack {
                Text(inf)
                    .font(.system(size: 10))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .foregroundColor(.background)
                    .background(
                        Rectangle()
                            .clipShape(RoundedCorner(radius: 6, corners: [.topRight, .bottomRight]))
                            .foregroundColor(correctColor(inf: inf))

                        )

                Spacer()
            }
        }
    }
    
    func correctColor(inf: String) -> Color {
        if inf == Information.new {
            return .purpleMarker
        } else if inf == Information.blowToPrices {
            return .redMarker
        } else if inf == Information.priceByCard {
            return .greenMarker
        } else {
            return .clear
        }
    }
    
    @ViewBuilder
    var discount: some View {
        if let value = product.discount {
            HStack {
                Spacer()
                Text("\(value)%")
                    .font(.system(size: 17)).bold()
                    .foregroundColor(.discount)
            }
        }
    }
    @ViewBuilder
    var purchasePanel: some View {
        HStack {
            VStack (spacing: 2) {
                Text(String(format: "%.2f ₽/%@", product.price, product.measurement))
                    .font(.system(size: 15)).bold()
                    .lineLimit(1)
                    .foregroundColor(.label)
                    .minimumScaleFactor(0.5)
                if let oldPrice = product.oldPrice {
                    HStack {
                        Text(String(format: "%.2f", oldPrice))
                            .strikethrough()
                            .font(.system(size: 12))
                            .lineLimit(1)
                            .foregroundColor(.subLabel)
                            .minimumScaleFactor(0.5)
                        Spacer()
                    }
                }
            }
            Spacer()
            Image.cart
        }.padding(.horizontal, 3)
    }
    private func loadImage() {
           DispatchQueue.global().async {
               if let url = URL(string: product.image), let _ = try? Data(contentsOf: url) {
                   DispatchQueue.main.async {
                       isImageLoaded = true
                   }
               }
           }
       }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: ViewModel().products[0])
    }
}
