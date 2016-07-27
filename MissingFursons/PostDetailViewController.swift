//
//  PostDetailViewController.swift
//  MissingFursons
//
//  Created by Taylor Beck on 7/7/16.
//  Copyright © 2016 Taylor Beck. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    
    var animalIndex = Int()
    var animals = [Animal]()
    var ownerName = String()
    var location = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = animals[animalIndex].name
//        self.navigationController?.navigationBar.topItem?.title = animals[animalIndex].name
        
        let url = NSURL(string: animals[animalIndex].imageURL)
        let data = NSData(contentsOfURL: url!)

        imageView.image = UIImage(data: data!)
        nameLabel.text = animals[animalIndex].name
        ageLabel.text = String(animals[animalIndex].age)
        phoneButton.setTitle(animals[animalIndex].phone, forState: .Normal)
        phoneButton.contentHorizontalAlignment = .Left;
        ownerNameLabel.text = animals[animalIndex].ownerName
        locationLabel.text = animals[animalIndex].location

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func phoneButtonPressed(sender: AnyObject) {
        if let url = NSURL(string: "tel://\(sender.titleLabel!!.text!)") {
            print("URL VALID")
            UIApplication.sharedApplication().openURL(url)
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
