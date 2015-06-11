//
//  DetailMovieViewController.swift
//  FindAMovie
//
//  Created by Paul on 09/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    
    @IBOutlet var movieTitle: UILabel!
    
    @IBOutlet var releaseDate: UILabel!
    
    @IBOutlet var overview: UITextView!
    
    @IBOutlet var poster: UIImageView!
    
    var movie: Movie?
    let api = MovieDbService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.overview.editable = false

        if let movieDetail = self.movie {
            
            self.navigationItem.title = movieDetail.title
            
            self.movieTitle.text = movieDetail.title
            self.releaseDate.text = "Sortie le \(movieDetail.releaseDate!)"
            self.overview.text = movieDetail.overview
            
            // Using image cache
            if let poster = movieDetail.getImageURL() {
                
                self.poster.hnk_setImageFromURL(poster) {
                    (let image) in
                    self.poster.image = image
                }
                
            }
            
            api.getMovieImages(movieDetail.id) {
                (let images) in
                
                println(images?.list)
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
}
