//
//  Model.swift
//  MySpar
//
//  Created by Александра Маслова on 14.08.2023.
//

import Foundation

struct Product {
    var id: String
    var category: String
    var inf: String?
    var image: String
    var price: Double
    var oldPrice: Double?
    var measurement: String
    var discount: Int?
}

struct Stories: Hashable {
    let imageName: String
    let description: String
    var isViewed: Bool
    init(imageName: String, description: String, isViewed: Bool = false) {
        self.imageName = imageName
        self.description = description
        self.isViewed = isViewed
    }
}
