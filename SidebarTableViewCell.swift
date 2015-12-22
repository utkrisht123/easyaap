//
//  SidebarTableViewCell.swift
//  Gallery
//
//  Created by For EveryOne on 21/12/15.
//  Copyright © 2015 For EveryOne. All rights reserved.
//

import UIKit

class SidebarTableViewCell: UITableViewCell {

    @IBOutlet weak var profilepic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profilepic.layer.cornerRadius = self.profilepic.frame.size.width / 2;
        self.profilepic.layer.borderColor = UIColor.whiteColor().CGColor
        self.profilepic.clipsToBounds = true;
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
