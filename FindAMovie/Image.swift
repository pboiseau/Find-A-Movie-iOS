//
//  Image.swift
//  FindAMovie
//
//  Created by Paul on 11/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

class Image {
 
    var id: Int
    var file_path: String
    var width: Int
    var height: Int
    
    init(id: Int, file_path: String, width: Int, height: Int){
        self.id = id
        self.file_path = file_path
        self.width = width
        self.height = height
    }
    
}