//
//  Movies.swift
//  FindAMovie
//
//  Created by Paul on 06/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

/**
 *  Movies class
 */
class Movies: NSObject {
    
    var list: [Movie] = [Movie]()
    var genres: String
    
    var total_pages: Int
    var total_results: Int
    
    private var cursor: Int = 0
    private var iterator: IndexingGenerator<Array<Movie>>
    private var current: Movie?
    
    /**
     Initialize a new movies object
     
     - parameter moviesDictionary: [String: AnyObject]
     - parameter genres:           String
     */
    init(moviesDictionary: [String: AnyObject], genres: String) {
        
        let movies = moviesDictionary["results"] as! [[String:AnyObject]]
        
        self.total_pages = moviesDictionary["total_pages"] as! Int
        self.total_results = moviesDictionary["total_results"] as! Int
        self.genres = genres
        
        for movie in movies {
            
            let id = movie["id"] as! Int
            let title = movie["title"] as! String
            let backdropPath = movie["backdrop_path"] as? String
            let overview = movie["overview"] as? String
            let originalTitle = movie["original_title"] as! String
            let releaseDate = movie["release_date"] as? String
            let posterPath = movie["poster_path"] as? String
            
            list.append(Movie(id: id, title: title, backdropPath: backdropPath, overview: overview, originalTitle: originalTitle, releaseDate: releaseDate, posterPath: posterPath))
            
        }
        
        self.iterator = list.generate()
    }
    
    /**
     Get current movie on the iterator
     
     - returns: Movie
     */
    func getCurrent() -> Movie? {
        if (current != nil) {
            return current
        }
        
        return nil
    }
    
    /**
     Iterator to the next movie in the list
     
     - returns: Movie
     */
    func next() -> Movie? {
        
        if let movie = self.iterator.next() {
            self.cursor++
            self.current = movie
            return movie
        }
        
        return nil
    }
    
    /**
     Return the previous movie from the list
     
     - returns: Movie
     */
    func prev() -> Movie? {
        
        if self.list.count == 0 {
            return nil
        }
        
        if self.cursor <= 0 {
            self.cursor = self.list.endIndex - 1
        } else {
            self.cursor--
        }
        
        let movie = self.list[self.cursor]
        
        return movie
    }
    
}