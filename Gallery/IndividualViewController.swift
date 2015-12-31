//
//  IndividualViewController.swift
//  Gallery
//
//  Created by For EveryOne on 17/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class IndividualViewController: UIViewController {
   
    @IBOutlet weak var EmailTextFeild: UITextField!
    @IBOutlet weak var PasswordTextFeild: UITextField!
    override func viewDidLoad() {
    //self.view.backgroundColor = UIColor.init(red: 0, green: 0.154, blue: 0.154, alpha: 1)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func IndividualLogin(sender: AnyObject) {
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.Gray
        self.view.addSubview(actInd)
        actInd.startAnimating()
        let email_id = EmailTextFeild.text!
        let password = PasswordTextFeild.text!
        let request = NSMutableURLRequest(URL: NSURL(string: "http://gyansha.co.in/easylearning/student/lms/OAuthLogin/individual")!)
        request.HTTPMethod = "POST"
        let postString = "username=\(email_id)&password=\(password)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let semaphore = dispatch_semaphore_create(0)
        _ = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            actInd.startAnimating()
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                let AletView: UIAlertController = UIAlertController(title: "Error", message: "Sorry!! Something Went Wrong!!", preferredStyle: .Alert)
                self.addChildViewController(AletView)
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                let AletView: UIAlertController = UIAlertController(title: "Error", message: "Sorry!! Something Went Wrong!! Try Again!!", preferredStyle: .Alert)
                self.addChildViewController(AletView)
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
                actInd.stopAnimating()
            }
           
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            dispatch_semaphore_signal(semaphore)
            print(1)
        }.resume()
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        print(2)
        actInd.stopAnimating()
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
