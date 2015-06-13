import Foundation
import Alamofire

/**
*  Network Operation class to perform webservice request
*/
class NetworkOperation {
    
    let queryURL: String
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]? -> Void)
    
    /**
    Initialize NetworkOperation
    
    :param: url URL of the web service
    */
    init(url: String) {
        self.queryURL = url
    }
    
    /**
    Execute a GET request to featch data from the web
    
    :param: completion Callback to retour JSON Dictionnary
    */
    func executeRequest(completion: JSONDictionaryCompletion) {
        
        Alamofire
            .request(.GET, self.queryURL)
            .responseJSON{
                (request, response, data, error) in
                
                if let httpResponse = response {
                    
                    switch httpResponse.statusCode {
                    case 200:
                        
                        let jsonDictionary = data as? [String: AnyObject]
                        
                        completion(jsonDictionary)
                        
                    default:
                        println("GET request not successful. HTTP status code: \(httpResponse.statusCode)")
                    }
                    
                } else {
                    println("Error: Not a valid HTTP response")
                    completion(nil)
                }
        }
        
    }
    
    /**
    Get data form URL
    
    :param: url NSURL
    :param: completion (NSData) -> Void
    */
    func getDataFromUrl(url: NSURL, completion: ((data: NSData?) -> Void)) {
        
        NSURLSession.sharedSession().dataTaskWithURL(url) {
            (data, response, error) in
            
            if let error = error {
                println(error)
            }
            
            completion(data: data)
            
            }.resume()
        
    }
    
}