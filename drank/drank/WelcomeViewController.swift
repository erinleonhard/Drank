//
//  WelcomeViewController.swift
//  drank
//
//  Created by Erin Leonhard on 7/25/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import UIKit
import Parse

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewDidAppear(animated: Bool) {
        let currentUser = PFUser.currentUser()
        if currentUser == nil {
            print("currentUSer was nil! Should login!")
        }
        else{
            print("currentUSer was not nil!")
            performSegueWithIdentifier("WelcomeSeg", sender: self)
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
