//
//  FeedVCViewController.swift
//  Dyve
//
//  Created by Anas Hmamouch on 6/3/16.
//  Copyright © 2016 Benzino. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //create a reference of posts
        DataService.instance.REF_POSTS.observeEventType(.Value, withBlock: {snapshot in
            print(snapshot.value)
            
            
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                
                for snap in snapshots {
                    print(snap)
                    
                    if let postDict = snap.value as? Dictionary<String, AnyObject>{
                        let key = snap.key
                        let post = Post(postKey: key, dictionary: postDict)
                        self.posts.append(post)
                        
                    }
                
                }
            }
            
            self.tableView.reloadData()
            })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell{
            cell.configureCell(post)
            return cell
        }else{
            return PostCell()
        }
        
    }

}
