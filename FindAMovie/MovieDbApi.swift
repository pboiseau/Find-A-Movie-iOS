//
//  MovieDbApi.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

struct MovieDbApi {
    
    let apiKey = "061aa72cb2da19956a42cf429bbe0e0d"
    
    let apiUrl = "http://api.themoviedb.org/3/"
    
    func baseUrl() -> NSURL {
        return NSURL(string: "\(apiUrl)")!
    }
    
}


