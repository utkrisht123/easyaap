//
//  app_brain.swift
//  Gallery
//
//  Created by For EveryOne on 01/01/16.
//  Copyright © 2016 For EveryOne. All rights reserved.
//

import Foundation
class app_brain{
    
    var data1 : NSData! = nil
    var res : Int = 0
    var returnValue = NSArray()
    var i : Int = 0
    
    func login(userName: String,passWord: String)-> Int{
        
        
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://gyansha.co.in/easylearning/student/lms/OAuthLogin")!)
        request.HTTPMethod = "POST"
        let postString = "username=mayank@easylearning.guru&password=13"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
        
        
        
        return 1
        
        
        
        //        let semaphore = dispatch_semaphore_create(0)
        //        let BASE_URL = "http://admin.gyansha.co.in/AdminAPI/rest/admin/login?user_name=\(userName)&password=\(passWord)"
        //        let session = NSURLSession.sharedSession()
        //        let url = NSURL(string: BASE_URL)!
        //        let request = NSURLRequest(URL: url)
        //
        //        let _ = session.dataTaskWithRequest(request){data,responce,error in
        //            self.data1 = data!
        //            dispatch_semaphore_signal(semaphore)
        //            }.resume()
        //        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        //        var parsedResult : AnyObject!
        //
        //        do{
        //            print(" API is ")
        //            parsedResult = try NSJSONSerialization.JSONObjectWithData(self.data1, options: NSJSONReadingOptions.AllowFragments)
        //            print(parsedResult)
        //
        //            let pR = parsedResult as! NSDictionary
        //
        //            //print(pR)
        //
        //            let records = pR["records"] as! NSArray
        //            let responce = records[0]["Response"] as! Int
        //
        //            self.res = responce
        //        }
        //        catch{
        //            print("You Bloody Fool")
        //            }
        //        return res
    }
    
    func fetchTotalRequest() -> NSArray{
        let date = NSDate()
        
        //et calendar = NSCalendar.currentCalendar()
        
        let dateFomatter = NSDateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        let dateFinal = dateFomatter.stringFromDate(date)
        
        //let BASE_URL = "http://admin.gyansha.co.in/AdminAPI/rest/admin/admin-main?from=\(dateFinal)&to=\(dateFinal)"
        let semaphore = dispatch_semaphore_create(0)
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "http://admin.gyansha.co.in/AdminAPI/rest/admin/admin-main?from=\(dateFinal)&to=\(dateFinal)")
        let request = NSURLRequest(URL: url!)
        let _ = session.dataTaskWithRequest(request){ data,responce,error in
            self.data1 = data
            dispatch_semaphore_signal(semaphore)
            }.resume()
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        var returningResuest : [String] = []
        
        do{
            
            let parsedResult = try NSJSONSerialization.JSONObjectWithData(self.data1, options: NSJSONReadingOptions.AllowFragments)
            let ResultSet = parsedResult as! NSDictionary
            let records = ResultSet["record"] as! NSDictionary
            let request = records["Request"] as! NSDictionary
            let course = request["course"] as! NSArray
            for eachCourse in course{
                let CourseName = eachCourse["Course"] as! NSString
                let courseRequest = eachCourse["Request"] as! Int
                returningResuest.append("\(CourseName) Has \(courseRequest) Request")
            }
            
            let totalRequest = request["total_REQUEST"] as! Int
            
            returningResuest.append("The Total No. Of Request \(totalRequest)")
            
            let callback_request = records["Callback_Request"] as! NSArray
            let callback_request_no_dic = callback_request[0] as! NSDictionary
            let callback_request_no = callback_request_no_dic["Request"] as! Int
            
            returningResuest.append("No Of Callback Request \(callback_request_no)")
            
            let contact_request = records["Contact_Request"] as! NSArray
            let contact_request_no_dic = contact_request[0] as! NSDictionary
            let contact_request_no = contact_request_no_dic["Request"] as! Int
            
            returningResuest.append("No Of Contact Request \(contact_request_no)")
            
            let payment_request = records["payment_request"] as! NSDictionary
            let ccavanue_request = payment_request["ccavenue_request"] as! NSArray
            let ccavanue_request_no_dic = ccavanue_request[0] as! NSDictionary
            let ccavanue_request_no = ccavanue_request_no_dic["Request"] as! Int
            
            returningResuest.append("CCavanue Request \(ccavanue_request_no)")
            
            
            
            let paypal_request = payment_request["paypal_request"] as! NSArray
            let paypal_request_no_dic = paypal_request[0] as! NSDictionary
            let paypal_request_no = paypal_request_no_dic["Request"] as! Int
            
            returningResuest.append("Paypal Request \(paypal_request_no)")
            
            self.returnValue = returningResuest
            
        }catch{
            print("Someting Went Wrong")
        }
        
        return self.returnValue
    }
    
}