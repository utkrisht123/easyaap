//
//  CourseTableViewController.swift
//  easylearningfinal
//
//  Created by For EveryOne on 02/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class CourseTableViewController: UITableViewController {

    @IBOutlet weak var Mycourses: UIBarButtonItem!
    var courses = [Course]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        Mycourses.target = self.revealViewController()
//        Mycourses.action = Selector("revealToggle:")
        self.navigationController?.navigationItem.leftBarButtonItems = nil
        self.tableView.separatorColor = UIColor.clearColor()
    loadSamplecourse()
    }
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        self.tableView.reloadData()
//    }

    func loadSamplecourse() {
      
        
        let photo1 = UIImage(named: "kvy")!
        
        let course1 = Course(photo: photo1)!
        
        let photo2 = UIImage(named: "kvy")!
        let course2 = Course(photo: photo2)!
        
        let photo3 = UIImage(named: "kvy")!
        let course3 = Course(photo: photo3)!
        
        let photo4 = UIImage(named: "kvy")!
        let course4 = Course(photo: photo4)!
        
        let photo5 = UIImage(named: "kvy")!
        let course5 = Course(photo: photo5)!
        
        let photo6 = UIImage(named: "kvy")!
        let course6 = Course(photo: photo6)!
        
        courses += [course1, course2, course3, course4, course5, course6]
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return courses.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CourseTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CourseTableViewCell
        let seprator : CALayer = CALayer(layer: cell)
        seprator.backgroundColor = UIColor.whiteColor().CGColor
        seprator.frame = CGRectMake(0,0,self.view.frame.size.width,1)
        cell.layer.addSublayer(seprator)
        // Fetches the appropriate meal for the data source layout.
        let course = courses[indexPath.row]
        let destinationSize : CGSize = CGSize(width: self.view.frame.width, height: 119)
        UIGraphicsBeginImageContext(destinationSize)
        course.photo!.drawInRect(CGRectMake(0,0,destinationSize.width,destinationSize.height))
        let newPhoto :UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let bfImage :UIColor = UIColor(patternImage:newPhoto)
       cell.backgroundColor = bfImage
        return cell
    }
 
    
}
