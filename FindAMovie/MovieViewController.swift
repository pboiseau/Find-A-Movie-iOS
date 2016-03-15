//
//  MovieViewController.swift
//  FindAMovie
//
//  Created by Paul on 04/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation
import UIKit
import Haneke

/**
 *  Movie View Controller
 */
class MovieViewController: UIViewController {
    
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var moviePoster: UIImageView!
    @IBOutlet var movieDescription: UITextView!
    
    var categories: Categories!
    var movies: Movies?
    
    var current_page: Int = 0
    
    let api = MovieDbService()
    
    /**
     Retrieve movies from Movie Db Service after loading the view filter by categories
     */
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.movieDescription.editable = false
        
        // left swipe
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        
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
     Hide the navigation bar
     
     - parameter animated: Bool
     */
    override func viewWillAppear(animated: Bool) {
        navigationBarTitle()
    }
    
    /**
     Set navigation bar title to categories name
     */
    func navigationBarTitle() -> Void {
        var title = ""
        
        for category in (categories.list) {
            if categories.currentList.contains(category.id) {
                title += "\(category.name) "
            }
        }
        
        navigationItem.title = title
    }
    
    /**
     Fetch the next movies from the API using the page number
     */
    func fetchNextMovies() {
        
        if let genres = self.categories?.listToString(type: "AND"){
            
            api.getMovies(genres, page: self.getNextPage()) {
                (let moviesObject) in
                
                if moviesObject?.list.count > 0 {
                    
                    self.movies = moviesObject
                    self.nextMovie(nil)
                    print("fetching next movies")
                    
                } else {
                    self.setAlert("Films introuvable", message: "Aucun film ne correspond à votre requête. Merci de la modifier et de relancer une recherche")
                }
                
            }
            
        }
        
    }
    
    /**
     Get the next page of the API results
     
     - returns: Int
     */
    func getNextPage() -> Int {
        let page = (++current_page <= movies!.total_pages) ? current_page : 1
        return page
    }
    
    /**
     Handler to detect swipe and execute action
     
     - parameter sender:
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
     
     - parameter sender:
     */
    @IBAction func nextMovie(sender: UIButton?) {
        
        if let nextMovie = movies!.next() {
            
            self.movieTitle.text = nextMovie.title
            
            if let description = nextMovie.overview {
                self.movieDescription.text = description
            }
            
            // Using image cache
            if let poster = nextMovie.getImageURL() {
                
                self.moviePoster.hnk_setImageFromURL(poster) {
                    (let image) in
                    self.moviePoster.slideInFromRight(0.3, completionDelegate: nil) {
                        self.moviePoster.image = image
                    }
                }
                
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
                
                self.moviePoster.slideInFromLeft(0.3, completionDelegate: nil)
                self.moviePoster.image = image
            }
        }
        
    }
    
    /**
     Print alert info for user when no movies was found on the MovieDBService
     
     - parameter title:   String
     - parameter message: String
     */
    func setAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    /**
     Catch like button press and store movie on the database
     
     - parameter sender: UIButton
     */
    @IBAction func likeMovie(sender: UIButton) {
        print("we need to save the movie in the database")
    }
    
    /**
     Send Movie Object to the Detail View Controller
     
     - parameter segue:  UIStoryboardSegue
     - parameter sender: AnyObject
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showMovieDetail" {
            
            let detailMovieViewController = segue.destinationViewController as? DetailMovieViewController
            detailMovieViewController!.movie = self.movies!.getCurrent()
        }
        
    }
    
    
}
