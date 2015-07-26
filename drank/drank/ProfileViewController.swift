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
    @IBOutlet weak var WeightBtn: UIButton!
    @IBOutlet weak var WeightInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeightInputTextField.hidden = true;
        OKBtn.hidden = true;
        
        var currentUser = PFUser.currentUser()
        var name = "";
        var sex = "";
        var weight = "";
        var username = "";
        var email = "";
        
        if let name = currentUser!["name"] as? String {
            self.NameTextField.text = name
        } else {
            self.NameTextField.text = ""
        }
        
        if let sex = currentUser!["isMale"] as? Bool {
            if (sex == true) {
                self.SexTextField.text = "Male"
            } else {
                self.SexTextField.text = "Female"
            }
        } else {
            self.SexTextField.text = ""
        }
        
        
        if let weight = currentUser!["weight"] as? Int {
            self.WeightBtn.setTitle(String(weight), forState: .Normal)
            self.WeightInputTextField.text = String(weight);
        } else {
            self.WeightBtn.setTitle("", forState: .Normal)
        }
        
        if let username = currentUser!["username"] as? String {
            self.UsernameTextField.text = username;
        } else {
            self.UsernameTextField.text = "";
        }
        
        if let email = currentUser!["email"] as? String {
            self.EmailTextField.text = email
        } else {
            self.EmailTextField.text = ""
        }
        
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
    
    @IBAction func UpdateWeightBtn(sender: AnyObject) {
        WeightBtn.hidden = true
        WeightInputTextField.hidden = false
        // set WeightInputTextField.text to something
        OKBtn.hidden = false
    }
    
    @IBAction func ApproveWeightChangeBtn(sender: AnyObject) {
        // send udpated weight to database
        WeightBtn.hidden = false;
        WeightBtn.setTitle(WeightInputTextField.text, forState: .Normal)
        WeightInputTextField.hidden = true;
        OKBtn.hidden = true;
    }
    
    
    @IBAction func LogoutBtn(sender: AnyObject) {
        PFUser.logOut()
        var currentUser = PFUser.currentUser() // this will now be nil
    }
}

