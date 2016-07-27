//
//  Post.swift
//  MissingFursons
//
//  Created by Taylor Beck on 7/5/16.
//  Copyright © 2016 Taylor Beck. All rights reserved.
//

import Foundation


// LETS
class Post {
    let location: String
    let animal_id: Int
    let phone: String
    let id: Int
    let found_status: Bool
    let created_at: String
    let date: String
    let email: String
    let user_id: Int
    let updated_at: String
    
    init(location: String, animal_id: Int, phone: String, id: Int, found_status: Bool, created_at: String, date: String, email: String, user_id: Int, updated_at: String) {
        self.location = location
        self.animal_id = animal_id
        self.phone = phone
        self.id = id
        self.found_status = found_status
        self.created_at = created_at
        self.date = date
        self.email = email
        self.user_id = user_id
        self.updated_at = updated_at
    }
}