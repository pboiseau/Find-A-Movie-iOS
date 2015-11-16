//
//  Image.swift
//  FindAMovie
//
//  Created by Paul on 11/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

/**
*  Image class
*/
class Image {
 
    var id: Int
    var file_path: String?
    var width: Int?
    var height: Int?
    
    /**
    Initialize a new image
    
    - parameter id:        Int
    - parameter file_path: String (optional)
    - parameter width:     Int (optional)
    - parameter height:    Int (optional)
    */
    init(id: Int, file_path: String?, width: Int?, height: Int?){
        self.id = id
        
        if let path = file_path {
           self.file_path = path
        }
        
        if let w = width {
            self.width = w
        }
        
        if let h = height {
            self.height = h
        }
        
    }
    
    /**
    Return image URL using file_path
    
    - returns: NSURL (optional)
    */
    func getImageURL() -> NSURL? {
        
        if let image = self.file_path {
            
            let api = MovieDbService()
            let imageURL = NSURL(string: api.movieDbImageUrl + "w185/" + image)
            
            return imageURL
            
        }
        
        return nil
    }
    
}