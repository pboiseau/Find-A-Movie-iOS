//
//  MovieCellCollectionViewCell.swift
//  FindAMovie
//
//  Created by Paul on 09/12/2015.
//  Copyright © 2015 Hetic. All rights reserved.
//

import UIKit
import Haneke

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    var movie: Movie! {
        didSet {
            movieTitle.text = movie.title
            if let poster = movie.getImageURL() {
                moviePoster.hnk_setImageFromURL(poster)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
