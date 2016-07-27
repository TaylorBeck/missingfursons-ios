//
//  Feed.swift
//  MissingFursons
//
//  Created by Taylor Beck on 7/5/16.
//  Copyright © 2016 Taylor Beck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class PostsFeed {
    
    internal func getPosts(controller: PostsTableViewController) -> Void {
        let localURL = "http://localhost:3000/posts_json"
        let herokuURL = "http://missingfursons.herokuapp.com/posts_json"
        
        Alamofire.request(.GET, herokuURL, parameters: ["":""])
            .responseJSON { response in
                
                // SwiftyJSON
                let json_arr = JSON(data: response.data!)
                
//                print(json_arr)
                
                for (_, subJson):(String, JSON) in json_arr {
                    //Do something you want
                    
                    controller.posts.append(
                        Post(
                            location: subJson["location"].stringValue,
                            animal_id: subJson["animal_id"].intValue,
                            phone: subJson["phone"].stringValue,
                            id: subJson["id"].intValue,
                            found_status: subJson["found_status"].boolValue,
                            created_at: subJson["created_at"].stringValue,
                            date: subJson["date"].stringValue,
                            email: subJson["email"].stringValue,
                            user_id: subJson["user_id"].intValue,
                            updated_at: subJson["updated_at"].stringValue
                        )
                    )
                }
                controller.tableView.reloadData();
        }
    }
}