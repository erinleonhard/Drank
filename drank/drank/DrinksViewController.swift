//
//  DrinksViewController.swift
//  drank
//
//  Created by Luke Street on 7/25/15.
//  Copyright © 2015 Xtern. All rights reserved.
//

import UIKit
import Parse

class DrinksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var currentCategory : String = "Hard Alcohol"
    @IBOutlet var drinkLabel: UITextField!
    @IBOutlet var tableView: UITableView!
    var drinks: [drinkModel] = []
    
    func appDrinks(drink : drinkModel) {
        self.drinks.append(drink)
    }
    override func viewWillAppear(animated: Bool) {
        //var drinkss : [drinkModel] = []
        PFCloud.callFunctionInBackground("grabDrinkByType", withParameters: ["DrinkType":currentCategory]) {
            (response: AnyObject?, error: NSError?) -> Void in
            print (response)
            //var drinksss : [drinkModel] = []
            let array = response as! NSArray
            for pfobj in array {
                let obj = pfobj as! PFObject
                let name = obj.valueForKey("Name") as! String //dataForKey("Name")!.description
                let percent = obj.valueForKey("percentAlcohol") as! Double
                let cals = obj.valueForKey("calories") as! Int
                print("\(name) + \(percent) + \(cals)")
                let drink : drinkModel = drinkModel(name: name, percentAlcohol: percent, calories: cals)
                self.appDrinks(drink)
                print("pass")
                self.tableView.reloadData()
            }
            //print(drinkss[0].name)
            //self.drinks = drinks
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(drinks[0].name)
        
        
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
        cell.drinkNameLabel.text = self.drinks[indexPath.row].name
        cell.percentAlcLabel.text = "\(self.drinks[indexPath.row].percentAlcohol)% Alc"
        cell.calLabel.text = "\(self.drinks[indexPath.row].calories) Cals"
        
        //cell.setDrinkName(self.drinks[indexPath.row])
        
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
