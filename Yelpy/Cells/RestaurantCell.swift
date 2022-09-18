//
//  RestaurantCellTableViewCell.swift
//  Yelpy
//
//  Created by Trang Do on 9/10/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!

    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    var rating: Int? = 0
    
    var r: Restaurant! {
        didSet {
            label.text = r.name
            restaurantImage.af.setImage(withURL: r.imageURL!)
            restaurantImage.layer.cornerRadius = 10
            restaurantImage.clipsToBounds = true
            category.text = r.mainCategory
            ratingImage.image = Stars.dict[r.rating]!
            reviewCount.text = String(r.reviews) + " reviews"
            phoneNumber.text = r.phone
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
