//
//  Movies.swift
//  FindAMovie
//
//  Created by Paul on 06/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

class Movies: NSObject {
    
    var list: [Movie] = [Movie]()
    var genres: String
    
    var total_pages: Int
    var total_results: Int
    
    private var cursor: Int = 0
    private var iterator: IndexingGenerator<Array<Movie>>
    private var current: Movie?
    
    init(moviesDictionary: [String: AnyObject], genres: String) {
        
        let movies = moviesDictionary["results"] as! [[String:AnyObject]]
        
        self.total_pages = moviesDictionary["total_pages"] as! Int
        self.total_results = moviesDictionary["total_results"] as! Int
        self.genres = genres
        
        for movie in movies {
            
            var id = movie["id"] as! Int
            var title = movie["title"] as! String
            var backdropPath = movie["backdrop_path"] as? String
            var overview = movie["overview"] as? String
            var originalTitle = movie["original_title"] as! String
            var releaseDate = movie["release_date"] as? String
            var posterPath = movie["poster_path"] as? String
            
            list.append(Movie(id: id, title: title, backdropPath: backdropPath, overview: overview, originalTitle: originalTitle, releaseDate: releaseDate, posterPath: posterPath))
            
        }
        
        self.iterator = list.generate()
    }
    
    func getCurrent() -> Movie? {
        if let movie = current {
            return current
        }
        
        return nil
    }
    
    /**
    Iterator to the next movie in the list
    
    :returns: Movie
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
    
    :returns: Movie
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
        
        var movie = self.list[self.cursor]
        
        return movie
    }
    
}