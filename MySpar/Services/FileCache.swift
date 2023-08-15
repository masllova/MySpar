//
//  FileCache.swift
//  MySpar
//
//  Created by Александра Маслова on 14.08.2023.
//

import Foundation
import SwiftyJSON

final class FileCache {
    
    static func parseBanners() -> [String]? {
        if let fileURL = Bundle.main.url(forResource: "Directions", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: fileURL) {
                do {
                    let json = try JSON(data: jsonData)
                    let bannersArray = json[Keys.banners.rawValue].arrayValue
                    let banners = bannersArray.map { $0.stringValue }
                    return banners
                } catch {
                    print("Error parsing banners JSON: \(error)")
                    return nil
                }
            }
        }
        return nil
    }
    static func parseProducts() -> [Product]? {
        if let fileURL = Bundle.main.url(forResource: "Directions", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: fileURL) {
                do {
                    let json = try JSON(data: jsonData)
                    let productsArray = json[Keys.products.rawValue].arrayValue
                    var products: [Product] = []
                    for productJSON in productsArray {
                        let id = productJSON[Keys.id.rawValue].stringValue
                        let category = productJSON[Keys.category.rawValue].stringValue
                        let inf = productJSON[Keys.information.rawValue].string
                        let image = productJSON[Keys.image.rawValue].stringValue
                        let price = productJSON[Keys.price.rawValue].double
                        let oldPrice = productJSON[Keys.old_price.rawValue].double
                        let measurement = productJSON[Keys.measurement.rawValue].stringValue
                        let discount = productJSON[Keys.discount.rawValue].int
                        
                        let product = Product(id: id, category: category, inf: inf, image: image, price: price!, oldPrice: oldPrice, measurement: measurement, discount: discount)
                        products.append(product)
                    }
                    return products
                } catch {
                    print("Error parsing products JSON: \(error)")
                    return nil
                }
            }
        }
        return nil
    }
    
    private enum Keys: String {
        case products
        case banners
        case id
        case category
        case information
        case image
        case price
        case old_price
        case measurement
        case discount
    }
}
