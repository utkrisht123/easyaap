//
//  InitialViewController.swift
//  Gallery
//
//  Created by For EveryOne on 18/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var login: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 0x2C/255, green: 0x3E/255, blue: 0x50/255, alpha: 1);
        self.navigationController!.navigationBar.translucent = false
        login.backgroundColor = UIColor.clearColor()
        login.layer.cornerRadius = 5
        login.layer.borderWidth = 1
        login.layer.borderColor = UIColor.whiteColor().CGColor

        // Do any additional setup after loading the view.
    }

    @IBAction func logintomain(sender: AnyObject) {
        
        
        self.performSegueWithIdentifier("mainlogin", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
}
