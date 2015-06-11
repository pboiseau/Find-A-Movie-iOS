//
//  Images.swift
//  FindAMovie
//
//  Created by Paul on 11/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

class Images: NSObject {
    
    var list: [Image] = [Image]()
    
    init(imagesDictionary: [String: AnyObject]) {
        
        let images = imagesDictionary["backdrops"] as! [[String:AnyObject]]
        
        var id = 1
        
        for image in images {
            
            var id = id
            var file_path = image["file_path"] as? String
            var width = image["width"] as? Int
            var height = image["height"] as? Int
            
            list.append(Image(id: id, file_path: file_path, width: width, height: height))
            id++
        }
        
    }
    
    
}