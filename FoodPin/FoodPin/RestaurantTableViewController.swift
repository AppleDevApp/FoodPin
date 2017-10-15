//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by AppleDevApp on 13/10/17.
//  Copyright © 2017年 AppleDevApp. All rights reserved.
//

import UIKit

fileprivate let capCellIdentity = "CapCell"
fileprivate let cellIdentity = "Cell"

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    private var checkedIndexPath = Set<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let capCellNib = UINib.init(nibName: "RestaurentCapTableViewCell", bundle: nil)
        self.tableView.register(capCellNib, forCellReuseIdentifier: capCellIdentity)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentity, for: indexPath) as! RestaurantTableViewCell
            
            // Configure the cell...
            cell.nameLabel.text = restaurantNames[indexPath.row]
            cell.thumbnailImageView.image = UIImage(named:restaurantImages[indexPath.row])
            cell.locationLabel.text = restaurantLocations[indexPath.row]
            cell.typeLabel.text = restaurantTypes[indexPath.row]
            cell.accessoryType = self.checkedIndexPath.contains(indexPath) ? .checkmark : .none
            
            return cell;
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: capCellIdentity, for: indexPath) as! RestaurentCapTableViewCell
            
            // Configure the cell...
            cell.nameLabel.text = restaurantNames[indexPath.row]
            cell.thumbnailImageView.image = UIImage(named:restaurantImages[indexPath.row])
            cell.locationLabel.text = restaurantLocations[indexPath.row]
            cell.typeLabel.text = restaurantTypes[indexPath.row]
            cell.serialNum.text = String(indexPath.row)
            cell.accessoryType = self.checkedIndexPath.contains(indexPath) ? .checkmark : .none
            
            
            return cell;
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Show Alert View
        let alertController = UIAlertController(title: "What do you want to do?", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Call 123-456-789", style: .default, handler: {(alertController:UIAlertAction) in
            // In simulate,We can't telephone
            let mobileUrl = URL(string: "tel://10000")
            if !UIApplication.shared.canOpenURL(mobileUrl!) {
                print("Open Phone Failed")
                let alertController = UIAlertController(title: "Service Unavailable", message: "Sorry,In Your Iphone Could Not Telephone A Number", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            UIApplication.shared.open(mobileUrl!, options: [:], completionHandler: nil)
        }))
        alertController.addAction(UIAlertAction(title: "Check in", style: .default, handler: { (alertAction:UIAlertAction) in
            // Check the row selected
            print("Selected At Row index \(indexPath.row)")
            let selectedCell = tableView.cellForRow(at: indexPath)
            if self.checkedIndexPath.contains(indexPath) {
                selectedCell?.accessoryType = .none
                self.checkedIndexPath.remove(indexPath)
            } else {
                selectedCell?.accessoryType = .checkmark
                self.checkedIndexPath.insert(indexPath)
            }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
