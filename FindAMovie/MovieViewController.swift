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
    
    var categories: Categories?
    let api = MovieDbService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let genres = self.categories?.listToString(type: "AND"){
            
            api.getMovies(genres, page: 20) {
                (let movies) in
                
                println(movies)
                
            }
        
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
