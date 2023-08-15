//
//  Texts.swift
//  MySpar
//
//  Created by Александра Маслова on 15.08.2023.
//

import SwiftUI

enum TabBarLabels: String, CaseIterable {
    case main = "Главная"
    case catalog = "Каталог"
    case cart = "Корзина"
    case profile = "Профиль"
    
    var label: some View {
        Text(rawValue)
    }
}
