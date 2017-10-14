//
//  RestaurentCapTableViewCell.swift
//  FoodPin
//
//  Created by AppleDevApp on 14/10/17.
//  Copyright © 2017年 AppleDevApp. All rights reserved.
//

import UIKit

class RestaurentCapTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var locationLabel:UILabel!
    @IBOutlet var typeLabel:UILabel!
    @IBOutlet var thumbnailImageView:UIImageView!
    @IBOutlet var serialNum:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
