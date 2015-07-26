//
//  DrinkDetailViewController.swift
//  drank
//
//  Created by Luke Street on 7/25/15.
//  Copyright © 2015 Xtern. All rights reserved.
//

import UIKit

class DrinkDetailViewController: UIViewController {
    @IBOutlet weak var drinkStatusLabel: UILabel!
    @IBOutlet weak var drinkAmountLabel: UILabel!
    @IBAction func wasVeryWeak(sender: AnyObject) {
        self.drinkStatusLabel.text = "Very Weak"
    }
    
    @IBAction func wasWeak(sender: AnyObject) {
        drinkStatusLabel.text = "Weak"
    }
    @IBAction func wasStandard(sender: AnyObject) {
        drinkStatusLabel.text = "Standard"
    }
    @IBAction func wasStrong(sender: AnyObject) {
        drinkStatusLabel.text = "Strong"
    }
    @IBAction func wasVeryStrong(sender: AnyObject) {
        drinkStatusLabel.text = "Very Strong"
    }
    @IBAction func hadTwoDrinks(sender: AnyObject) {
        drinkAmountLabel.text = "Two Drinks"
    }
    @IBAction func hadThreeDrinks(sender: AnyObject) {
        drinkAmountLabel.text = "Three Drinks"
    }
    @IBAction func hadOneDrink(sender: AnyObject) {
        drinkAmountLabel.text = "One Drink"
    }
    @IBAction func hadHalfDrink(sender: AnyObject) {
        drinkAmountLabel.text = "Half a Drink"
    }
    @IBAction func addDrink(sender: AnyObject) {
        performSegueWithIdentifier("toDashboard", sender: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
