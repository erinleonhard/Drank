//
//  DrinksViewController.swift
//  drank
//
//  Created by Luke Street on 7/25/15.
//  Copyright © 2015 Xtern. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var currentCategory : String = ""
    @IBOutlet var drinkLabel: UITextField!
    @IBOutlet var tableView: UITableView!
    var drinks: [String] = ["We", "Heart", "Swift"]
    override func viewDidLoad() {
        super.viewDidLoad()
        switch currentCategory {
        case "favorites":
            print("Hello")
        case "mydrinks":
            print("Hello")
        case "recentdrinks":
            print("Hello")
        case "beers":
            print("Hello")
        case "wines":
            print("Hello")
        case "liquors":
            print("Hello")
        case "mixeddrinks":
            print("Hello")
        default:
            print("Hello")
        }
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count;
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : DrinkTableViewCell = (tableView.dequeueReusableCellWithIdentifier("DrinkTableViewCell") as! DrinkTableViewCell)
        print (self.drinks[indexPath.row])
        cell.setDrinkName(self.drinks[indexPath.row])
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        performSegueWithIdentifier("toDetails", sender: self)
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
