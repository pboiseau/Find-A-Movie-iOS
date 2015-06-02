//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct MovieDbApi {
    
    let apiKey = "061aa72cb2da19956a42cf429bbe0e0d"
    
    let apiUrl = "http://api.themoviedb.org/3/"
    
    func baseUrl() -> NSURL {
        return NSURL(string: "\(apiUrl)")!
    }
    
}

import XCPlayground
XCPSetExecutionShouldContinueIndefinitely()

let genre = NSURL(string: "genre/movie/list?api_key=\(MovieDbApi().apiKey)", relativeToURL: MovieDbApi().baseUrl())!

let request = NSMutableURLRequest(URL: genre)
request.addValue("application/json", forHTTPHeaderField: "Accept")

let session = NSURLSession.sharedSession()
let task = session.dataTaskWithRequest(request) { (data: NSData!, response: NSURLResponse!, error: NSError!) in
    
    if error != nil {
        // Handle error...
        return
    }
    
    println(error)
    println(response)
    println(NSString(data: data, encoding: NSUTF8StringEncoding))
}

task.resume()
