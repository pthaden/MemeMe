//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Paul Thaden on 7/28/15.
//  Copyright (c) 2015 Paul Thaden. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var shareButton: UIBarButtonItem!

    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            imageView.image = meme.memedImage
        
        
    }
    

    
    //Cancel button
    
    @IBAction func dismissModal(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }


}