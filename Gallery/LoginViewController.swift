//
//  LoginViewController.swift
//  Gallery
//
//  Created by For EveryOne on 18/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var individual: UIView!
    @IBOutlet weak var organization: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBAction func Segmentcontrol(sender: UISegmentedControl) {
        
        
        
        
        switch segment.selectedSegmentIndex
        {
        case 0:
            individual.hidden = false
            organization.hidden = true
        case 1:
            individual.hidden = true
            organization.hidden = false
        default:
            individual.hidden = false
            organization.hidden = true
        }
        
        
        
        
        
    }
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
