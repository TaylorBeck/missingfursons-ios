//
//  AnimalsFeed.swift
//  MissingFursons
//
//  Created by Taylor Beck on 7/6/16.
//  Copyright © 2016 Taylor Beck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class AnimalsFeed {
    
    internal func getAnimals(controller: PostsTableViewController) -> Void {
        let localURL = "http://localhost:3000/animals_json"
        let herokuURL = "http://missingfursons.herokuapp.com/animals_json"
        
        Alamofire.request(.GET, herokuURL, parameters: ["":""])
            .responseJSON { response in
                
                // SwiftyJSON
                let json_arr = JSON(data: response.data!)
                
                print(json_arr)
                
                for (_, subJson):(String, JSON) in json_arr {
                    //Do something you want

                    
                    controller.animals.append(
                        Animal(
                            imageURL: subJson["imageURL"].stringValue,
                            name: subJson["name"].stringValue,
                            age: subJson["age"].intValue,
                            phone: subJson["phone"].stringValue,
                            ownerName: subJson["owner"].stringValue,
                            location: subJson["location"].stringValue
                        )
                    )
                }
                controller.tableView.reloadData();
        }
    }
}
