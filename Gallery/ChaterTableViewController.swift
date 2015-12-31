//
//  ChaterTableViewController.swift
//  Gallery
//
//  Created by Utkrisht Mittal on 29/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class ChaterTableViewController: UITableViewController {
var bookArray = [String]()
    var assignment = [String]()
    var video = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        bookArray = ["Intro","Book1", "Book2", "Book3", "Book4"]
        
        assignment = ["Intro","Assignment1", "Assignment2", "Assignment3", "Assignment4"]
        video = ["Intro","Video1", "Video2", "Video3", "Video4"]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var n = bookArray.count + assignment.count + video.count + 3
        return 5
        
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell : UITableViewCell = UITableViewCell()
    
     if (indexPath.row >= 0 && indexPath.row <= bookArray.count)
     {
    cell = tableView.dequeueReusableCellWithIdentifier("moduledetail", forIndexPath: indexPath)
    
    cell.textLabel?.text = bookArray[indexPath.row]
    cell.selectionStyle = UITableViewCellSelectionStyle.None
    cell.textLabel?.textColor = UIColor.whiteColor()
    cell.backgroundColor = UIColor(red: 0x48/255, green: 0x48/255, blue: 0x48/255, alpha: 1);
        }
         else if (indexPath.row == bookArray.count + 1)
     {
        cell = tableView.dequeueReusableCellWithIdentifier("moduledetail", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Videos"
        
        }
        else if (indexPath.row >= (bookArray.count + 2) && indexPath.row <= (bookArray.count + video.count + 2))
     {
        cell = tableView.dequeueReusableCellWithIdentifier("moduledetail", forIndexPath: indexPath)
        
        cell.textLabel?.text = video[indexPath.row]
        }
        
        
     else if (indexPath.row == bookArray.count + video.count + 3)
     {
        cell = tableView.dequeueReusableCellWithIdentifier("moduledetail", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Assignment"
        
     }
        else if (indexPath.row >= (bookArray.count + video.count + 3) && indexPath.row <= (bookArray.count + video.count + assignment.count + 3))
     {
        cell = tableView.dequeueReusableCellWithIdentifier("moduledetail", forIndexPath: indexPath)
        
        cell.textLabel?.text = assignment[indexPath.row]

        }
    return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
