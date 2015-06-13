//
//  Categories.swift
//  FindAMovie
//
//  Created by Paul on 03/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

/**
*  Categories class
*/
class Categories: NSObject {
    
    var list: [Category] = [Category]()
    var currentList: [Int] = [Int]()
  
    /**
    Initialize a new categories object
    
    :param: categoriesDictionary [String: AnyObject]
    */
    init(categoriesDictionary: [String: AnyObject]) {
        
        self.list = [Category]()
        
        let categories = categoriesDictionary["genres"] as! [[String:AnyObject]]
        
        for category in categories {
            
            var id = category["id"] as! Int
            var name = category["name"] as! String
            
            list.append(Category(id: id, name: name))
            
        }
        
    }
    
    /**
    Return a list of categories in string separated by commo
    
    :param: type String
    :returns: String
    */
    func listToString(#type: String) -> String {
        
        var genres: [String] = []
        var separator = (type == "AND") ? "," : "|"
        
        for item in currentList {
            genres.append(String(item))
        }
        
        return join(separator, genres)
    }
    
}