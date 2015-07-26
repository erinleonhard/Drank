//
//  LoginViewController.swift
//  drank
//
//  Created by Erin Leonhard on 7/25/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent){
//        if let touch = touches.first as? UITouch{
//            view.endEditing(true)
//            super.touchesBegan(touches, withEvent: event);
//        }
//    }

    @IBAction func LoginBtn(sender: AnyObject) {
        if (self.UsernameTextField.text != nil &&
            self.PasswordTextField.text != nil)
        {
            PFUser.logInWithUsernameInBackground(self.UsernameTextField.text!, password: self.PasswordTextField.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                
                if user != nil {
                    self.performSegueWithIdentifier("LoginSeg", sender: self)
                } else {
                    let errorString = error!.userInfo["error"] as? NSString
                    self.ErrorLabel.text = errorString!.capitalizedString
                }
            }
        } else {
            self.ErrorLabel.text = "Must complete all fields."
        }
        
    }
}