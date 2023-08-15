//
//  ViewModel.swift
//  MySpar
//
//  Created by Александра Маслова on 14.08.2023.
//

import Foundation

final class ViewModel {
    let products = FileCache.parseProducts() ?? []
    let bannersURL = FileCache.parseBanners() ?? []
    
    var storiesCollection = [
        Stories(imageName: "s1", description: StoriesLabels.s1),
        Stories(imageName: "s2", description: StoriesLabels.s2),
        Stories(imageName: "s3", description: StoriesLabels.s3),
        Stories(imageName: "s4", description: StoriesLabels.s4),
        Stories(imageName: "s5", description: StoriesLabels.s5),
        Stories(imageName: "s6", description: StoriesLabels.s6),
        Stories(imageName: "s7", description: StoriesLabels.s7),
        Stories(imageName: "s8", description: StoriesLabels.s8)]
    let cardsCollection = ["c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10", "c11"]
    
    func getProductsByCategory (category: String) -> [Product] {
        products.filter { $0.category == category }
    }
    func choseLocation() {
       //
    }
    func storyByIndexIsViewed (index: Int) {
        //
    }
    func showBannersDetail() {
        //
    }
    func showPersonalSaleCardDetail() {
        //
    }
}
