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
    
    @IBOutlet var movieDescription: UITextView!
    
    var categories: Categories?
    var movies: Movies?
    
    let api = MovieDbService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.movieDescription.editable = false
        
        if let genres = self.categories?.listToString(type: "AND"){
            
            api.getMovies(genres, page: 20) {
                (let moviesObject) in
                
                self.movies = moviesObject
                self.nextMovie(nil)
                
            }
            
        }
        
    }
    
    @IBAction func nextMovie(sender: UIButton?) {
    
        var nextMovie = movies!.next()
        
        self.movieTitle.text = nextMovie.title
        
        if let description = nextMovie.overview {
            self.movieDescription.text = description
        }
        
        nextMovie.downloadImage {
            (let image) in
            
            self.moviePoster.image = image
        }
        
    }
    
    @IBAction func backToCategory(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
}
