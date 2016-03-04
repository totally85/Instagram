//
//  LoginViewController.swift
//  IG
//
//  Created by Allison Martin on 3/3/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinPressed(sender: AnyObject)
    {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!)
        {
            (user: PFUser?, error: NSError?) -> Void in
            
            if user != nil
            {
                print ("you're logged in")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }

    @IBAction func signupPressed(sender: AnyObject)
    {
        //Initialize user object
        let newUser = PFUser()
        
        //Set user properties
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        //Call sign up function on the object
        newUser.signUpInBackgroundWithBlock
        {
            (success: Bool, error: NSError?) -> Void in
            
            if success
            {
                print("Yay, new user")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            else
            {
                print(error?.localizedDescription)
                
                if error?.code == 202
                {
                    print("Username is taken")
                }
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
