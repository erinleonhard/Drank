//
//  HistoryDetailViewController.swift
//  drank
//
//  Created by Luke Street on 7/26/15.
//  Copyright © 2015 Xtern. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController {
    @IBAction func editDrink(sender: AnyObject) {
        performSegueWithIdentifier("toEditPage", sender: sender)
    }

    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var bacLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
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
