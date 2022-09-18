//
//  RestaurantDetailViewController.swift
//  Yelpy
//
//  Created by Trang Do on 9/17/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit
import AlamofireImage
class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    
    var r: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImage.af.setImage(withURL: r.imageURL!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
