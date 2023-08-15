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
    static let cart = Image("Cart")
    static let saleCard = Image("PersonalSaleCard")
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
