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
let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
    
    if error != nil {
        // Handle error...
        return
    }
    
    print(error)
    print(response)
    print(NSString(data: data, encoding: NSUTF8StringEncoding))
}

task.resume()

func doubler(i: Int) -> Int {
    return i * 2
}

let numbers = [1,2,3,4,5]

let doubleFunction = doubler
let doubledNumbers = numbers.map(doubleFunction)

// using closure
let tripledNumbers = numbers.map({ (i: Int) -> Int in return i * 3})

// Closure Shorthand Syntax

let tripleFunction = { (i: Int) -> Int in return i * 3 }
numbers.map(tripleFunction)

//////////////////////////////
// Closure Shorthand Syntax //
//////////////////////////////

// Rule #1
[1,2,3,4,5].map({ (i: Int) -> Int in return i * 3 })

// Rule #2: Infering Type from Context
[1,2,3,4,5].map({i in return i * 3})

// Rule #3: Implicit Return from Single Expression Closures
[1,2,3,4,5].map({i in i * 3})

// Rule #4: Shorthand Argument Names
[1,2,3,4,5].map({$0 * 3})

// Rule #5: Trailing Closures
[1,2,3,4,5].map() {$0 * 3}

// Rule #6: Ignoring Parentheses
[1,2,3,4,5].map {$0 * 3}


var arrayTest = [12,25,33,40,25]

if !arrayTest.contains(1222){
    print("yes")
}

arrayTest.indexOf(33)

print(arrayTest)

var genres = [222,32,176,9,7]

var test = genres.generate()

test.next()
test.next()
test.next()


var genresString: [String] = []

for genre in genres {
    genresString.append(String(genre))
}

genresString.joinWithSeparator(",")

func testparam(name: String = "Paul") -> String {
    return name
}

testparam("adrien")

var current_page = 3
var max_page = 7

let page = (++current_page <= max_page) ? current_page : 1





