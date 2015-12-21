//
//  Meal.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 5/26/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information.
//

import UIKit

class Course: NSObject, NSCoding {
    // MARK: Properties
    
    var photo: UIImage?
    
    
    // MARK: Types
    
    struct PropertyKey {
        static let photoKey = "photo"
        }

    // MARK: Initialization
    
    init?(photo: UIImage?) {
        // Initialize stored pßroperties.
        self.photo = photo
        
        super.init()
        
       
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
               aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
              // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        // Must call designated initializer.
        self.init(photo: photo)
    }

}