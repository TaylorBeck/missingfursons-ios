//
//  PostsTableViewController.swift
//  MissingFursons
//
//  Created by Taylor Beck on 7/5/16.
//  Copyright © 2016 Taylor Beck. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PostsTableViewController: UITableViewController {
    
    var posts = [Post]();
    var animals = [Animal]();
    var animalToSendIndex = Int();
    
    @IBOutlet var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postsFeed = PostsFeed()
        postsFeed.getPosts(self)
        
        let animalsFeed = AnimalsFeed()
        animalsFeed.getAnimals(self)
//        
//        getDataForTable()
    }
    
    func getDataForTable() {

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return posts.count
        return animals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath)
        
        let url = NSURL(string: animals[indexPath.row].imageURL)
        let data = NSData(contentsOfURL: url!)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        let nameLabel = cell.viewWithTag(2) as! UILabel
        let ageLabel = cell.viewWithTag(3) as! UILabel
        let phoneLabel = cell.viewWithTag(4) as! UILabel
        
        imageView.image = UIImage(data: data!)
        nameLabel.text = animals[indexPath.row].name
        ageLabel.text = String(animals[indexPath.row].age)
        phoneLabel.text = animals[indexPath.row].phone
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        animalToSendIndex = indexPath.row

        performSegueWithIdentifier("postDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if (segue.identifier == "postDetailSegue") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destinationViewController as! PostDetailViewController
            
            viewController.animals = animals
            viewController.animalIndex = animalToSendIndex
        }
        
    }
    
    @IBAction func refreshBarButtonClicked(sender: AnyObject) {
//        getDataForTable()
    }

}
