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
       
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "login_page_F-1")!)
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
