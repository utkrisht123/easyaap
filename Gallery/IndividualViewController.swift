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
    let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
    //self.view.backgroundColor = UIColor.init(red: 0, green: 0.154, blue: 0.154, alpha: 1)
        
        // Do any additional setup after loading the view.
        actInd.frame = CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height);
        actInd.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func IndividualLogin(sender: AnyObject) {
        if Reachability.isConnectedToNetwork(){
        self.view.addSubview(actInd)
        actInd.startAnimating()
        let email_id = EmailTextFeild.text!
        let password = PasswordTextFeild.text!
        let request = NSMutableURLRequest(URL: NSURL(string: "http://gyansha.co.in/easylearning/student/lms/OAuthLogin/individual")!)
        request.HTTPMethod = "POST"
        let postString = "username=\(email_id)&password=\(password)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        //let semaphore = dispatch_semaphore_create(0)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                self.actInd.stopAnimating()
                let AletView: UIAlertController = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
                let ok : UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: { (ok) -> Void in
                    AletView.dismissViewControllerAnimated(true, completion: nil)
                })
                AletView.addAction(ok)
                self.presentViewController(AletView, animated: true, completion:nil)
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                self.actInd.stopAnimating()
                let AletView: UIAlertController = UIAlertController(title: "Error", message: "We got HTTP Status Code \(httpStatus.statusCode)", preferredStyle: .Alert)
                let ok : UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: { (ok) -> Void in
                    AletView.dismissViewControllerAnimated(true, completion: nil)
                })
                AletView.addAction(ok)
                self.presentViewController(AletView, animated: true, completion:nil)
            }
           
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
           // dispatch_semaphore_signal(semaphore)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if data?.length > 0 {
                self.actInd.stopAnimating()
                print(1)
                }
            })
            
        }
        //dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        
        task.resume()
        }
        else
        {
            self.actInd.stopAnimating()
            let AletView: UIAlertController = UIAlertController(title: "Error", message: "Sorry you are connected to internet.", preferredStyle: .Alert)
            let ok : UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: { (ok) -> Void in
                AletView.dismissViewControllerAnimated(true, completion: nil)
            })
            AletView.addAction(ok)
            self.presentViewController(AletView, animated: true, completion:nil)
        }
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
