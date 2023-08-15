//
//  Images.swift
//  MySpar
//
//  Created by Александра Маслова on 15.08.2023.
//

import SwiftUI

extension Image {
    static let location = Image("Location")
    static let lines = Image(systemName: "line.3.horizontal")
    static let cart = Image("Card")
    static let saleCard = Image("PersonalSaleCard")
    }

enum ImagesCollections {
    static let cards = [Image("c1"), Image("c2"), Image("c3"), Image("c4"), Image("c5"), Image("c6"), Image("c7"), Image("c8"), Image("c9"), Image("c10"), Image("c11")]
    static let stories = [Image("s1"), Image("s2"), Image("s3"), Image("s4"), Image("s5"), ]
}

enum TabBarImages: String, CaseIterable {
    case main = "Spar"
    case catalog = "Catalog"
    case cart = "ShoppingCart"
    case profile = "Person"
    
    var image: Image {
        return Image(self.rawValue)
            .renderingMode(.template)
    }
    
    var selectedColor: Color {
        return .greenAccent
    }
    
    var deselectedColor: Color {
        return .subLabel
    }
}
