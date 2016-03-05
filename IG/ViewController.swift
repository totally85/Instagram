//
//  ViewController.swift
//  IG
//
//  Created by Allison Martin on 3/3/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutPressed(sender: AnyObject)
    {
        PFUser.logOut()
        print("user is logged out")
        
        self.navigationController?.popViewControllerAnimated(true) //takes you back to the original view controller (login)
    }


}

