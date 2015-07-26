//
//  DrinkTableViewCell.swift
//  drank
//
//  Created by Luke Street on 7/25/15.
//  Copyright © 2015 Xtern. All rights reserved.
//

import UIKit

class DrinkLogTableViewCell: UITableViewCell {
    
    @IBOutlet var drinkImage: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet var percentAlcLabel: UILabel!
    @IBOutlet var calLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    
    func setDrinkName(name : String) {
        self.drinkNameLabel.text = name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
}
