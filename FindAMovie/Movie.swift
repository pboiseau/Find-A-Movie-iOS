//
//  Movie.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

class Movie {

    var id: Int
    var title: String
    var backdropPath: String
    var overview: String
    var originalTitle: String
    var releaseDate: String
    var posterPath: String
    
    init(id: Int, title: String, backdropPath: String, overview: String, originalTitle: String, releaseDate: String, posterPath: String){
        self.id = id
        self.title = title
        self.backdropPath = backdropPath
        self.overview = overview
        self.originalTitle = originalTitle
        self.releaseDate = releaseDate
        self.posterPath = posterPath
    }
}