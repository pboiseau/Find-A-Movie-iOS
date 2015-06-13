//
//  MovieDbService.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation

/**
*  TMDB API Service
*  api.themoviedb.org/3/
*/
class MovieDbService {
    
    let apiKey = "061aa72cb2da19956a42cf429bbe0e0d"
    let language = "fr"
    let movieDbBaseUrl = "http://api.themoviedb.org/3/"
    let movieDbImageUrl = "http://image.tmdb.org/t/p/"
    
    /**
    Retrieve categories from TMDB API
    
    :param: completion (Categories) -> Void
    */
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
    
    /**
    Retrieve movies by categories
    
    :param: genres String list of genres separate by comma
    :param: page Int
    :param: completion (Movies) -> Void
    */
    func getMovies(genres: String, page: Int = 1, completion: (Movies?) -> Void) {
        
        let request: String = "\(movieDbBaseUrl)discover/movie?api_key=\(apiKey)&"
        let parameter: String = "page=\(page)&sort_by=popularity.desc&language=\(self.language)&with_genres=\(genres)"
        
        let networkOperation = NetworkOperation(url: "\(request)\(parameter)")
        
        networkOperation.executeRequest {
            (let moviesJSON) in
            
            if let api_movies = moviesJSON {
                var movies = Movies(moviesDictionary: api_movies, genres: genres)
                
                // callback
                completion(movies)
            }
            
        }
    }
    
    /**
    Retrieve images associated with a movie
    
    :param: id
    :param: completion (Images) -> Void
    */
    func getMovieImages(id: Int, completion: (Images?) -> Void) {
        
        let request: String = "\(movieDbBaseUrl)movie/\(id)/images?api_key=\(apiKey)&"

        let networkOperation = NetworkOperation(url: "\(request)")
        
        networkOperation.executeRequest {
            (let imagesJSON) in
                        
            if let api_images = imagesJSON {
                var images = Images(imagesDictionary: api_images)
                
                // callback
                completion(images)
            }
            
        }
        

    }
    
}
