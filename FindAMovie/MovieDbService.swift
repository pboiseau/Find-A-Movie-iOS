//
//  MovieDbService.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

class MovieDbService {
    
    let apiKey = "061aa72cb2da19956a42cf429bbe0e0d"
    
    let movieDbBaseUrl = "http://api.themoviedb.org/3/"
    
    func getCategories() {
        
        let networkOperation = NetworkOperation(url: "\(movieDbBaseUrl)genre/movie/list?api_key=\(apiKey)")
        
        networkOperation.executeRequest {
            (let categories) in
            
            println(categories)
        }
        
    }
    
    
    
}


