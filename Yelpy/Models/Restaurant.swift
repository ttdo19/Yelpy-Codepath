//
//  Restaurant.swift
//  Yelpy
//
//  Created by Trang Do on 9/17/22.
//  Copyright © 2022 memo. All rights reserved.
//

import Foundation

class Restaurant {
    var imageURL: URL?
    var url: URL?
    var name: String
    var mainCategory: String
    var phone: String
    var rating: Double
    var reviews: Int
    
    init(dict: [String: Any]) {
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        phone = dict["display_phone"] as! String
        url = URL(string: dict["url"] as! String)
        reviews = dict["review_count"] as! Int
        rating = dict["rating"] as! Double
        mainCategory = Restaurant.getMainCategory(dict: dict)
    }
    
    static func getMainCategory(dict: [String: Any]) -> String {
        let categories = dict["categories"] as! [[String: Any]]
        return categories.first?["title"] as! String
    }
}
