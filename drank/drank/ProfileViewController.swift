//
//  ProfileViewController.swift
//  drank
//
//  Created by Erin Leonhard on 7/26/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    @IBOutlet weak var NameTextField: UILabel!
    @IBOutlet weak var SexTextField: UILabel!
    @IBOutlet weak var UsernameTextField: UILabel!
    @IBOutlet weak var EmailTextField: UILabel!
    @IBOutlet weak var PasswordText: UIButton!
    @IBOutlet weak var OKBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var currentUser = PFUser.currentUser()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ChangePasswordBtn(sender: AnyObject) {
        if (PasswordText.titleLabel?.text == "Reset Password") {
            PFUser.requestPasswordResetForEmailInBackground(self.EmailTextField.text!)
            PasswordText.setTitle("Check your email.", forState: .Normal)
        }
    }
    
    @IBAction func LogoutBtn(sender: AnyObject) {
        PFUser.logOut()
        var currentUser = PFUser.currentUser() // this will now be nil
    }
}

