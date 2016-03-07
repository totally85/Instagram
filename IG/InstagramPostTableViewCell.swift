//
//  InstagramPostTableViewCell.swift
//  IG
//
//  Created by Allison Martin on 3/6/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstagramPostTableViewCell: UITableViewCell {

   /* override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    
    
    @IBOutlet weak var uploadedPic: PFImageView!
    
    var instagramPost: PFObject! {
        didSet {
            self.uploadedPic.file = instagramPost["image"] as? PFFile
            self.uploadedPic.loadInBackground()
        }
    }

}
