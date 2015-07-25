//
//  CategoryCollectionViewCell.swift
//  drank
//
//  Created by Luke Street on 7/25/15.
//  Copyright © 2015 Xtern. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var button: UIButton!
    @IBAction func toDrinkList(sender: AnyObject) {
        button.setTitle("Pressed", forState: .Normal)
        
    }
}
