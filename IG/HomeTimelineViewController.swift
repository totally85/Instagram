//
//  HomeTimelineViewController.swift
//  IG
//
//  Created by Allison Martin on 3/6/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit
import Parse

class HomeTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PFObject]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.getPosts()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList", name: "load", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPosts()
    {
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("CreatedAt")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock
        {
            (results: [PFObject]?, error: NSError?) -> Void in
            if error == nil
            {
                self.posts = results
                self.tableView.reloadData()
            }
            else
            {
                print(error)
            }
        }
    }
    func loadList(notification: NSNotification)
    {
        self.getPosts()
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if posts != nil{
            return posts!.count
        }
        else
        {
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
       let cell = tableView.dequeueReusableCellWithIdentifier("IGCells", forIndexPath: indexPath) as! InstagramTableViewCell
        
        cell.getPhotoandCaption = posts![indexPath.row]
        
        return cell
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
