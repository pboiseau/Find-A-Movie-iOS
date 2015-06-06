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
    let language = "fr"
    let movieDbBaseUrl = "http://api.themoviedb.org/3/"
    
    func getCategories(completion: (Categories?) -> Void) {
        
        let networkOperation = NetworkOperation(url: "\(movieDbBaseUrl)genre/movie/list?api_key=\(apiKey)&language=\(self.language)")
        
        networkOperation.executeRequest {
            (let categoriesJSON) in
            
            if let categories = categoriesJSON {
                var categories = Categories(categoriesDictionary: categories)
                
                // callback
                completion(categories)
            }
            
        }
        
    }
    
    func getMovies(genres: String, page: Int, completion: (Movies?) -> Void) {
        
        let request: String = "\(movieDbBaseUrl)discover/movie?api_key=\(apiKey)&"
        let parameter: String = "page=\(page)&sort_by=popularity.desc&language=\(self.language)&with_genres=\(genres)"
        
        let networkOperation = NetworkOperation(url: "\(request)\(parameter)")
        
        networkOperation.executeRequest {
            (let moviesJSON) in
            
            println(moviesJSON)
        
            if let api_movies = moviesJSON {
                var movies = Movies(moviesDictionary: api_movies)
                
                // callback
                completion(movies)
            }
            
        }
    }
    
    
    
}
