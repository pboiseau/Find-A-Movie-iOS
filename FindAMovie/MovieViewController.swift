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
    
    var current_page: Int = 0
    
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
        
        if let genres = self.categories?.listToString(type: "AND"){
            
            api.getMovies(genres, page: 1) {
                (let moviesObject) in
                
                self.movies = moviesObject
                self.nextMovie(nil)
                self.current_page = 1
                
            }
            
        }
        
    }
    
    /**
    Fetch the next movies from the API using the page number
    */
    func fetchNextMovies() {
        
        if let genres = self.categories?.listToString(type: "AND"){
            
            api.getMovies(genres, page: self.getNextPage()) {
                (let moviesObject) in
                
                self.movies = moviesObject
                self.nextMovie(nil)
                
                println("fetching next movies")
                
            }
    
        }
    }
    
    /**
    Get the next page of the API results
    
    :returns: Int
    */
    func getNextPage() -> Int {
        let page = (++current_page <= movies!.total_pages) ? current_page : 1
        println(page)
        return page
    }
    
    /**
    Handler to detect swipe and execute action
    
    :param: sender
    */
    func handleSwipes(sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .Left {
            self.nextMovie(nil)
        }
        
        if sender.direction == .Right {
            self.prevMovie()
        }
        
    }
    
    
    /**
    Fetch the next movies from the movies object
    
    :param: sender
    */
    @IBAction func nextMovie(sender: UIButton?) {
        
        if let nextMovie = movies!.next() {
            
            self.movieTitle.text = nextMovie.title
            
            if let description = nextMovie.overview {
                self.movieDescription.text = description
            }
            
            nextMovie.downloadImage {
                (let image) in
                
                self.moviePoster.slideInFromRight(duration: 0.3, completionDelegate: nil)
                self.moviePoster.image = image
            }
        } else {
            fetchNextMovies()
        }
        
    }
    
    
    /**
    Fetch the previous movies from the movies object
    */
    func prevMovie() {
        
        if let prevMovie = movies!.prev() {
            
            self.movieTitle.text = prevMovie.title
            
            if let description = prevMovie.overview {
                self.movieDescription.text = description
            }
            
            prevMovie.downloadImage {
                (let image) in
                
                self.moviePoster.slideInFromLeft(duration: 0.3, completionDelegate: nil)
                self.moviePoster.image = image
            }
        }
        
    }
    
    @IBAction func backToCategory(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
}
