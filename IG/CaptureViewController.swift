//
//  CaptureViewController.swift
//  IG
//
//  Created by Allison Martin on 3/5/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var capturePicture: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let vc = UIImagePickerController()
        vc.delegate = self
        
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            vc.sourceType = .Camera
            
        }
        else if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)
        {
            vc.sourceType = .PhotoLibrary
        }
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage

        
        // Do something with the images (based on your use case)
        
        self.capturePicture.image = originalImage
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismissViewControllerAnimated(true, completion: nil)
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
