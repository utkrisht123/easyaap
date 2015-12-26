//
//  ModulesTableViewController.swift
//  Gallery
//
//  Created by For EveryOne on 22/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class ModulesTableViewController: UITableViewController {
    
    var TableArray = [String]()
    var TableImage = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        TableArray = ["","Home", "Contact", "Settings", "Logout"]
        TableImage = ["","ic_home_white", "ic_contacts_white", "ic_settings_applications_white", "ic_exit_to_app_white"]
        tableView.separatorColor = UIColor .clearColor()
        self.view.backgroundColor = UIColor(red: 0x48/255, green: 0x48/255, blue: 0x48/255, alpha: 1)
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
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = UITableViewCell()
        
        if (indexPath.row == 0){
            cell = tableView.dequeueReusableCellWithIdentifier("Coursename", forIndexPath: indexPath)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
             cell.textLabel?.text = TableArray[indexPath.row]
        }
        else{
            cell = tableView.dequeueReusableCellWithIdentifier("Modules", forIndexPath: indexPath)
                        
        }
        return cell
    }
    
    //    override func set
    
    
    
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
