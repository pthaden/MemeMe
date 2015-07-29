//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Paul Thaden on 7/28/15.
//  Copyright (c) 2015 Paul Thaden. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        collectionView.reloadData()
        
        
    }
    
    // MARK: Collection View Data Source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.item]
        
        // Set the text and image
        cell.memeTopLabel.text = meme.topText
        cell.memeBottomLabel.text = meme.bottomText
        cell.memeImageView?.image = meme.originalImage
        
        return cell
    }
    

    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {

        //Grab the DetailVC from Storyboard
        let detailController = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController

        
        //Populate view controller with data from the select item
        detailController.meme = memes[indexPath.row]

        

        //Push it, push it good. Push it, push it real good
        detailController.hidesBottomBarWhenPushed = true

        navigationController?.pushViewController(detailController, animated: true)
        
    }
    

    
}