//
//  Category.swift
//  FindAMovie
//
//  Created by Paul on 02/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import Foundation
import Alamofire

class Category {
    
    let api = MovieDbApi()
    
    let categoryUrl = "genre/movie/list"
    
    func getCategories_Old() {
        
        let url = NSURL(string: "\(api.baseUrl())\(categoryUrl)?api_key=\(api.apiKey)")!
        
        let request = NSMutableURLRequest(URL: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = NSURLSession.sharedSession()
        
        // closure
        let task = session.dataTaskWithRequest(request) {
            (data: NSData!, response: NSURLResponse!, error: NSError!) in
            
            if error != nil {
                // Handle error...
                return
            }
            
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
                
        task.resume()
    
    }
    
    func getCategories() {
        
        Alamofire.request(.GET, "\(api.apiUrl)\(categoryUrl)?api_key=\(api.apiKey)")
            .responseJSON{ (request, response, data, error) in
                
            println(data)
        }
        
    }
    
}
