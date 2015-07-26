//
//  drinkModel.swift
//  drank
//
//  Created by James Mcglothlin on 7/25/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import Foundation

class drinkModel {
    var name: String = "";
    var percentAlcohol: Double = 0.0;
    var calories: Int = 0;
    
    init (name : String, percentAlcohol : Double, calories : Int){
        self.name = name;
        self.percentAlcohol = percentAlcohol;
        self.calories = calories;
    }
    
}