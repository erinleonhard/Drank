//
//  FirstViewController.swift
//  drank
//
//  Created by Erin Leonhard on 7/25/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController{
    var category : String = ""
    @IBAction func getFavoriteDrinks(sender: AnyObject){
        category = "favorites"
        performSegueWithIdentifier("toDrinks", sender: sender)
    }
    @IBAction func getMyDrinks(sender: AnyObject) {
        category = "mydrinks"
        performSegueWithIdentifier("toDrinks", sender: sender)
    }
    @IBAction func getFriendDrinks(sender: AnyObject) {
        category = "Whiskey"
        performSegueWithIdentifier("toDrinks", sender: sender)
    }
    @IBAction func getRecentDrinks(sender: AnyObject) {
        category = "Vodka"
        performSegueWithIdentifier("toDrinks", sender: sender)
    }
    @IBAction func getBeers(sender: AnyObject) {
        category = "Beer"
        performSegueWithIdentifier("toDrinks", sender: sender)
    }
    @IBAction func getWines(sender: AnyObject) {
        category = "Wine"
        performSegueWithIdentifier("toDrinks", sender: sender)
    }
    @IBAction func getLiquors(sender: AnyObject) {
        category = "Hard Alcohol"
        performSegueWithIdentifier("toDrinks", sender: sender)
    }
    @IBAction func getMixedDrinks(sender: AnyObject) {
        category = "Mixed"
        performSegueWithIdentifier("toDrinks", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "toDrinks"{


            //print(drinks[0].name)
            let vc = segue.destinationViewController as! DrinksViewController
            vc.currentCategory = category
            //vc.drinks = drinks
            //vc.colorString = colorLabel.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

