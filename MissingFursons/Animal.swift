//
//  Animal.swift
//  MissingFursons
//
//  Created by Taylor Beck on 7/6/16.
//  Copyright © 2016 Taylor Beck. All rights reserved.
//

import Foundation

class Animal {
    let imageURL: String
    let name: String
    let age: Int
    let phone: String
    let ownerName: String
    let location: String
    
    init(imageURL: String, name: String, age: Int, phone: String, ownerName: String, location: String) {
        self.imageURL = imageURL
        self.name = name
        self.age = age
        self.phone = phone
        self.ownerName = ownerName
        self.location = location
    }
}