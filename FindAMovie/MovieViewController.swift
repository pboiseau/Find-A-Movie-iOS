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
        
        // left swipe
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        if let genres = self.categories?.listToString(type: "AND"){
            
            api.getMovies(genres, page: 1) {
                (let moviesObject) in
                
                self.movies = moviesObject
                self.nextMovie(nil)
                
            }
            
        }
        
    }
    
    func handleSwipes(sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .Left {
            self.nextMovie(nil)
        }
        
        if sender.direction == .Right {
            self.prevMovie()
        }
        
    }
    
    @IBAction func nextMovie(sender: UIButton?) {
        
        if let nextMovie = movies!.next() {
            
            self.movieTitle.text = nextMovie.title
            
            if let description = nextMovie.overview {
                self.movieDescription.text = description
            }
            
            nextMovie.downloadImage {
                (let image) in
                
                self.moviePoster.slideInFromRight(duration: 0.4, completionDelegate: nil)
                self.moviePoster.image = image
            }
        }
        
    }
    
    func prevMovie() {
        
        if let prevMovie = movies!.prev() {
            
            self.movieTitle.text = prevMovie.title
            
            if let description = prevMovie.overview {
                self.movieDescription.text = description
            }
            
            prevMovie.downloadImage {
                (let image) in
                
                self.moviePoster.slideInFromLeft(duration: 0.4, completionDelegate: nil)
                self.moviePoster.image = image
            }
        }
        
    }
    
    @IBAction func backToCategory(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
}
