//
//  OrganizationViewController.swift
//  Gallery
//
//  Created by For EveryOne on 18/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class OrganizationViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0xE7/255, green: 0x3B/255, blue: 0x4B/255, alpha: 1)
        email.backgroundColor = UIColor(red: 0xE7/255, green: 0x3B/255, blue: 0x4B/255, alpha: 1)
        password.backgroundColor = UIColor(red: 0xE7/255, green: 0x3B/255, blue: 0x4B/255, alpha: 1)
        loginbutton.backgroundColor = UIColor(red: 0x94/255, green: 0x24/255, blue: 0x2F/255, alpha: 1)
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
