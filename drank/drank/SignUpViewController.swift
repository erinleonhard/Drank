//
//  SignUpViewController.swift
//  drank
//
//  Created by Erin Leonhard on 7/25/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var FemaleSelectedBtn: UISegmentedControl!
    @IBOutlet weak var MaleSelectedBtn: UISegmentedControl!
    @IBOutlet weak var ErrorMessagesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUpBtn(sender: AnyObject) {
        var user = PFUser()
            
        if (self.UsernameTextField.text != nil &&
            self.PasswordTextField.text != nil &&
            self.EmailTextField.text != nil &&
            self.NameTextField.text != nil &&
            self.WeightTextField.text != nil)
        {
            user.username = self.UsernameTextField.text
            user.password = self.PasswordTextField.text
            user.email = self.EmailTextField.text
            user["name"] = self.NameTextField.text
            user["isMale"] = self.MaleSelectedBtn.selected
            user["weight"] = self.WeightTextField.text.toInt()
        } else {
            self.ErrorMessagesLabel.text = "Must complete all fields."
            return;
        }
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            
            if (error != nil) {
                let errorString = error!.userInfo?["error"] as? NSString
                self.ErrorMessagesLabel.text = errorString!.capitalizedString
            } else {
                self.performSegueWithIdentifier("SignUpSeg", sender: self)
            }
        }

    }
    
}
