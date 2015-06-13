//
//  Category.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

/**
*  Category class
*/
class Category: NSObject {
    
    var id: Int
    var name: String
    
    /**
    Initialize a new category
    
    :param: id Int
    :param: name String
    */
    init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
}
