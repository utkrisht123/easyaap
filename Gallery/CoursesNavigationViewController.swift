//
//  CoursesNavigationViewController.swift
//  Gallery
//
//  Created by Utkrisht Mittal on 29/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class CoursesNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationBar.barTintColor = UIColor(red: 0x2C/255, green: 0x3E/255, blue: 0x50/255, alpha: 1);
        self.navigationBar.barTintColor = UIColor(red: 60.0/255.0, green: 83.0/255.0, blue: 205.0/255.0, alpha: 1)
        self.navigationBar.translucent =  true
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName :UIColor.whiteColor()]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
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
