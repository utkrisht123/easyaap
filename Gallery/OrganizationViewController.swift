//
//  OrganizationViewController.swift
//  Gallery
//
//  Created by For EveryOne on 18/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class OrganizationViewController: UIViewController {
 
    @IBOutlet weak var PasswordTextFeild: UITextField!
    @IBOutlet weak var EmailTextFeild: UITextField!
    let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    var data : NSData?
    override func viewDidLoad() {
        super.viewDidLoad()
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
    @IBAction func Login(sender: UIButton) {
        if Reachability.isConnectedToNetwork(){
            self.view.addSubview(actInd)
            actInd.startAnimating()
            let email_id = EmailTextFeild.text!
            let password = PasswordTextFeild.text!
            let request = NSMutableURLRequest(URL: NSURL(string: "http://gyansha.co.in/easylearning/student/lms/OAuthLogin/organization")!)
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
                
                let svc = self.storyboard?.instantiateViewControllerWithIdentifier("2") as! MainTabBarViewController
                svc.data = data
                self.presentViewController(svc, animated: false, completion: nil)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if data?.length > 0 {
                        self.data = data
                        self.actInd.stopAnimating()
                    }
                })
                
            }
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "segueTest") {
            let svc = segue.destinationViewController as! MainTabBarViewController;
            svc.data = self.data
            print(svc.data)
            
        }
    }


}
