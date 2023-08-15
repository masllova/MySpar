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

enum StoriesLabels {
    static let s1 = "Мы в\nсоцсетях"
    static let s2 = "Сегодня\nв меню"
    static let s3 = "Ваши\nфавориты"
    static let s4 = "Chip-Chop"
    static let s5 = "Новинки\nнедели"
    static let s6 = "Рецепт\nнедели"
    static let s7 = "Ваши\nфавориты"
    static let s8 = "100 000\nбонусов"
}

enum Categories {
    static let recomendation = "Рекомендуем"
    static let sweetMood = "Sweet mood"
    // ...and others
}

enum Locations: String, CaseIterable {
    case moscow = "Москва, Москва и Московская область"
    // ...and others
    var label: some View {
        Text(rawValue)
    }
}
