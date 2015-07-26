//
//  FirstViewController.swift
//  drank
//
//  Created by Erin Leonhard on 7/25/15.
//  Copyright (c) 2015 Xtern. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var bac = 0.08;
    var waterDranken = 0.0;
    @IBOutlet weak var bacLabel: UILabel!
    @IBAction func drankWaterButton(sender: AnyObject) {
        self.waterDranken += 1.0;
        
        var waterAmount = (self.bac / 0.02) - self.waterDranken;
        print(waterAmount)
        if (waterAmount < 0.0){
            waterAmount = 0.0;
        }
        self.waterLogLabel.text = String(format: "%.0f", waterAmount);
        
    }
    @IBOutlet weak var waterLogLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        PFCloud.callFunctionInBackground("getBAC", withParameters: nil) {
            (response: AnyObject?, error: NSError?) -> Void in
            self.bac = response!.doubleValue
            //let dict = response as! NSDictionary
            //let array = dict["drinks"] as! NSArray
            
            var waterAmount = (self.bac / 0.02) - self.waterDranken;
            if (waterAmount < 0.0){
                waterAmount = 0.0;
            }
            self.waterLogLabel.text = String(format: "%.0f", waterAmount);
            
            self.bacLabel.text = String(format: "%.2f", self.bac);
            //let pfobj = array[0] as! PFObject
            //println("here: " + pfobj.valueForKey("Name")!.description)
            
        }
    }

}

