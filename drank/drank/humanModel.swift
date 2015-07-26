//
//  humanModel.swift
//  drank
//
//  Created by Kyle James Fischer on 7/26/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import Foundation

class humanModel {
    
    var displayName: String = "";
    var userName: String = "";
    var password: String = "";
    var id: String = "";
    var history: [drinkModel] = [];
    var height: Double = 0.0;
    var isMale: Bool = false;
    var email: String = "";
    var weight: Double = 0.0;
    
    init (displayName : String, userName : String,  id : String, height : Double, weight : Double, isMale : Bool, email : String, history : [drinkModel]){
        self.displayName = displayName;
        self.userName = userName;
        self.history = history;
        self.id = id;
        self.height = height;
        self.weight = weight;
        self.isMale = isMale;
        self.email = email;
    }
}