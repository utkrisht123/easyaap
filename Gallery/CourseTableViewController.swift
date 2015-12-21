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
        Mycourses.target = self.revealViewController()
        Mycourses.action = Selector("revealToggle:")
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 0x2C/255, green: 0x3E/255, blue: 0x50/255, alpha: 1);
        self.navigationController!.navigationBar.translucent = false
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
        
        // Fetches the appropriate meal for the data source layout.
        let course = courses[indexPath.row]
        cell.Courseimage.image = course.photo
                return cell
    }
    
}
