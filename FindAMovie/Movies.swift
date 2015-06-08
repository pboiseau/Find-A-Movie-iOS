//
//  Movies.swift
//  FindAMovie
//
//  Created by Paul on 06/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

import Foundation

class Movies: NSObject {
    
    var list: [Movie] = [Movie]()
    var cursor: Int = 0
    
    init(moviesDictionary: [String: AnyObject]) {
                
        let movies = moviesDictionary["results"] as! [[String:AnyObject]]
        
        for movie in movies {
            
            var id = movie["id"] as! Int
            var title = movie["title"] as! String
            var backdropPath = movie["backdrop_path"] as? String
            var overview = movie["overview"] as? String
            var originalTitle = movie["original_title"] as! String
            var releaseDate = movie["release_date"] as! String
            var posterPath = movie["poster_path"] as? String
            
            list.append(Movie(id: id, title: title, backdropPath: backdropPath, overview: overview, originalTitle: originalTitle, releaseDate: releaseDate, posterPath: posterPath))
            
        }
    }
    
    /**
    Iterator to the next movie in the list
    
    :returns: Movie 
    */
    func next() -> Movie? {
        
        
        if self.cursor >= self.list.count {
            self.cursor = 0
        }
        
        if self.list.count == 0 {
            return nil
        }
        
        var movie = self.list[self.cursor]
        self.cursor++
        
        return movie
    }
    
    func prev() -> Movie? {
        
        if self.list.count == 0 {
            return nil
        }
        
        if self.cursor <= 0 {
            self.cursor = self.list.count - 1
        } else {
            self.cursor--
        }
        
        var movie = self.list[self.cursor]
        
        return movie
    }
    
}