//
//  DrinkTableViewCell.swift
//  drank
//
//  Created by Luke Street on 7/25/15.
//  Copyright © 2015 Xtern. All rights reserved.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {

    @IBOutlet var drinkImage: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet var percentAlcLabel: UILabel!
    @IBOutlet var calLabel: UILabel!
    
    
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
