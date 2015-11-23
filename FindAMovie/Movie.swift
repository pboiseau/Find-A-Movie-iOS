//
//  Movie.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation
import UIKit

/**
*  Movie class
*/
class Movie {
    
    var id: Int
    var title: String
    var backdropPath: String?
    var overview: String?
    var originalTitle: String
    var releaseDate: String?
    var posterPath: String?
    
    /**
    Initialize a new movie
    
    - parameter id:            Int
    - parameter title:         String
    - parameter backdropPath:  String (optional)
    - parameter overview:      String (optional)
    - parameter originalTitle: String
    - parameter releaseDate:   String (optional)
    - parameter posterPath:    String (optional)
    */
    init(id: Int, title: String, backdropPath: String?, overview: String?, originalTitle: String, releaseDate: String?, posterPath: String?){
        
        self.id = id
        self.title = title
        
        if let backdrop = backdropPath {
            self.backdropPath = backdrop
        }
        
        if overview != nil {
            self.overview = overview!
        }
        
        if let poster = posterPath {
            self.posterPath = poster
        }
        
        self.originalTitle = originalTitle
        self.releaseDate = releaseDate
        
    }
    
    /**
    Retrieve image using poster path
    
    - parameter size:       String
    - parameter completion: (UIImage) -> Void
    */
    func downloadImage(size: String = "w500", completion: (UIImage?) -> Void){
        
        if let poster = self.posterPath {
            
            let api = MovieDbService()
            let imageURL = NSURL(string: api.movieDbImageUrl + size + "/" + poster)
            
            NetworkOperation(url: api.movieDbImageUrl).getDataFromUrl(imageURL!) {
                (data) in
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    let image = UIImage(data: data!)
                    completion(image)
                }
                
            }
            
        } else {
            print("This image doesn't have poster")
            
        }
    }
    
    /**
    Return image URL using poster path
    
    - returns: NSURL (optional)
    */
    func getImageURL() -> NSURL? {
        
        if let poster = self.posterPath {
            
            let api = MovieDbService()
            let imageURL = NSURL(string: api.movieDbImageUrl + "w500/" + poster)
            
            return imageURL
            
        }
        
        return nil
    }
    
}