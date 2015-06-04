//
//  Categories.swift
//  FindAMovie
//
//  Created by Paul on 03/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

class Categories: NSObject {
    
    var list: [Category]
    
    init(categoriesDictionary: [String: AnyObject]) {
        
        self.list = [Category]()
        
        let categories = categoriesDictionary["genres"] as! [[String:AnyObject]]
        
        for category in categories {
            
            var id = category["id"] as! Int
            var name = category["name"] as! String
            
            list.append(Category(id: id, name: name))
            
        }
        
    }

}