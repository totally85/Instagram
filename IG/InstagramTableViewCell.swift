//
//  InstagramTableViewCell.swift
//  IG
//
//  Created by Allison Martin on 3/6/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit
import Parse

class InstagramTableViewCell: UITableViewCell {


    @IBOutlet weak var myImage: UIImageView!

    @IBOutlet weak var myText: UILabel!

    
    var getPhotoandCaption: PFObject!
    {
        didSet
        {
            self.myText.text = getPhotoandCaption["caption"] as? String
            
            if let userPicture = getPhotoandCaption["media"] as? PFFile
            {
                userPicture.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                    if (error == nil) {
                        self.myImage.image = UIImage(data:imageData!)
                    }
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
