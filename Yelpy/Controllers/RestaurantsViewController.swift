//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    
    var restaurantArray: [Restaurant] = []
    
    var filteredRestaurant: [Restaurant]!
    
    var searchController: UISearchController!
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getAPIData()
        filteredRestaurant = restaurantArray
        
        //Initializing with searchResultsController set to nil means that
        //searchController will use this view controller to display the search results
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        //If we are using this same view controller to present the results
        //dimming it out wouldn't make sense. Should probably only set
        //this to yes if using another controller to display the search results.
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        //Sets this view controller as presenting view controller for the search interface
        definesPresentationContext = true
        
    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print(restaurants)
            self.restaurantArray = restaurants
            self.filteredRestaurant = restaurants
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurant.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = filteredRestaurant[indexPath.row]
        
        cell.r = restaurant
        
        return cell
    }
    
    //Override segue to pass the restaurant object to the DetailsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let r = filteredRestaurant[indexPath.row]
            let detailViewController = segue.destination as! RestaurantDetailViewController
            detailViewController.r = r
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if searchText.isEmpty {
                filteredRestaurant = restaurantArray
            } else {
                filteredRestaurant = restaurantArray.filter { restaurant in
                    return restaurant.name.contains(searchText)
                }
            }
            tableView.reloadData()
        }
    }
}




// ––––– TODO: Create tableView Extension and TableView Functionality


