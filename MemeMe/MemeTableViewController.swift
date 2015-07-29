//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Paul Thaden on 7/28/15.
//  Copyright (c) 2015 Paul Thaden. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var memes: [Meme]!

    override func viewDidLoad() {
        super.viewDidLoad()
//        if memes.count == 0 {
            performSegueWithIdentifier("createMemeSegue", sender: nil)
            
//        }

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        tableView.reloadData()
        
    }
    
    // MARK: Table View Data Source

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count

    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCell") as! UITableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the text and image
        cell.textLabel?.text = meme.topText + "; " + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        
        return cell
    }
    
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[indexPath.row]
        detailController.hidesBottomBarWhenPushed = true
        
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }

}

