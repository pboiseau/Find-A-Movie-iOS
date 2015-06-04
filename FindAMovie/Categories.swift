//
//  Categories.swift
//  FindAMovie
//
//  Created by Paul on 03/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

class Categories: NSObject {
    
    var list: [String: AnyObject]
    
    init(categoriesDictionary: [String: AnyObject]) {
        
        println("Categories")
        println(categoriesDictionary)
        self.list = categoriesDictionary
        
    }
}