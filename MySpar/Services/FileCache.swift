//
//  FileCache.swift
//  MySpar
//
//  Created by Александра Маслова on 14.08.2023.
//

import Foundation

final class FileCache {

    static func parseBanners() -> [String]? {
        if let fileURL = Bundle.main.url(forResource: "Directions", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: fileURL) {
                do {
                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
                       let bannersArray = json[Keys.banners.rawValue] as? [String] {
                        return bannersArray
                    }
                } catch {
                    print("Error parsing banners JSON: \(error)")
                }
            }
        }
        return nil
    }

    static func parseProducts() -> [Product]? {
        if let fileURL = Bundle.main.url(forResource: "Directions", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: fileURL) {
                do {
                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
                       let productsArray = json[Keys.products.rawValue] as? [[String: Any]] {
                        var products: [Product] = []
                        for productJSON in productsArray {
                            if let id = productJSON[Keys.id.rawValue] as? Int,
                               let _ = productJSON[Keys.name.rawValue] as? String,
                               let category = productJSON[Keys.category.rawValue] as? String,
                               let image = productJSON[Keys.image.rawValue] as? String,
                               let price = productJSON[Keys.price.rawValue] as? Double,
                               let measurement = productJSON[Keys.measurement.rawValue] as? String {
                                let inf = productJSON[Keys.information.rawValue] as? String
                                let oldPrice = productJSON[Keys.old_price.rawValue] as? Double
                                let discount = productJSON[Keys.discount.rawValue] as? Int

                                let product = Product(id: String(id), category: category, inf: inf, image: image, price: price, oldPrice: oldPrice, measurement: measurement, discount: discount)
                                products.append(product)
                            } else {
                                print("Error parsing product JSON: Invalid format")
                            }
                        }
                        return products
                    }
                } catch {
                    print("Error parsing products JSON: \(error)")
                }
            }
        }
        return nil
    }


    private enum Keys: String {
        case products
        case banners
        case id
        case name
        case category
        case information
        case image
        case price
        case old_price
        case measurement
        case discount
    }
}
