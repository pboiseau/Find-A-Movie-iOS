//
//  MoviesViewController.swift
//  FindAMovie
//
//  Created by Paul on 09/12/2015.
//  Copyright © 2015 Hetic. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var categories: Categories!
    var movies = [Movie]()
    
    let api = MovieDbService()
    static let movie_cell_identifier = "movie_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let genres = self.categories?.listToString(type: "AND"){
            api.getMovies(genres, page: 1) {
                (let moviesObject) in
                if let m = moviesObject {
                    self.movies += m.list
                }
                self.movieCollectionView.reloadData()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark - Collection Data Source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCellWithReuseIdentifier(MoviesViewController.movie_cell_identifier, forIndexPath: indexPath) as! MovieCollectionViewCell
        
        let row = indexPath.row
        movieCell.movie = movies[row]

        return movieCell
    }
    
    
}
