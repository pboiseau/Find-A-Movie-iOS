//
//  MovieViewController.swift
//  FindAMovie
//
//  Created by Paul on 04/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation
import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet var movieTitle: UILabel!
        
    @IBOutlet var moviePoster: UIImageView!
    
    var categories: Categories?
    var movies: Movies?
    
    let api = MovieDbService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let genres = self.categories?.listToString(type: "AND"){
            
            api.getMovies(genres, page: 20) {
                (let moviesObject) in
                
                self.movies = moviesObject
                var currentMovie = moviesObject!.next()
                
                self.movieTitle.text = currentMovie.title
            }
            
        }
        
    }
    
    @IBAction func nextMovie(sender: AnyObject) {
    
        var nextMovie = movies!.next()
        
        self.movieTitle.text = nextMovie.title
        
        nextMovie.downloadImage {
            (let image) in
            
            self.moviePoster.image = image
        }
        
    }
}
