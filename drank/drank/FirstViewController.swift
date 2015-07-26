//
//  FirstViewController.swift
//  drank
//
//  Created by Erin Leonhard on 7/25/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import UIKit
import Parse
//import SwiftyJSON


class FirstViewController: UIViewController {
    @IBOutlet weak var bacLabel: UILabel!
    @IBOutlet weak var waterLog: UILabel!
    @IBOutlet weak var runningTotalLabel: UILabel!
    var waterCount = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        //Called everytime the view is seen
       
    }
    
    
    @IBAction func buttonPressed(){
        PFCloud.callFunctionInBackground("grabDrinkByType", withParameters: ["DrinkType":"Hard Alcohol"]) {
            (response: AnyObject?, error: NSError?) -> Void in
            println (response)
            let dict = response as! NSDictionary
            let array = dict["drinks"] as! NSArray
            let pfobj = array[0] as! PFObject
            println("here: " + pfobj.valueForKey("Name")!.description)
            
        }
        println("done")

        
        waterLog.text = "232342342343"
        var tonightTotal = 8.00;
        runningTotalLabel.text = "Running Total: $" + String(format: "%.2f", tonightTotal);
        
    }
    
 

}

