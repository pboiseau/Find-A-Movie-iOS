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
     
     - parameter url: URL of the web service
     */
    init(url: String) {
        self.queryURL = url
    }
    
    /**
     Execute a GET request to featch data from the web
     
     - parameter completion: Callback to retour JSON Dictionnary
     */
    func executeRequest(completion: JSONDictionaryCompletion) {
        
        Alamofire
            .request(.GET, self.queryURL)
            .responseJSON {
                response in
                
                if let httpResponse = response.response {
                    
                    switch httpResponse.statusCode {
                    case 200:
                        let jsonDictionary = response.result.value as? [String: AnyObject]
                        
                        completion(jsonDictionary)
                    default:
                        print("GET request not successful. HTTP status code: \(httpResponse.statusCode)")
                    }
                    
                } else {
                    print("Error: Not a valid HTTP response")
                    completion(nil)
                }
        }
        
    }
    
    /**
     Get data form URL
     
     - parameter url: NSURL
     - parameter completion: (NSData) -> Void
     */
    func getDataFromUrl(url: NSURL, completion: ((data: NSData?) -> Void)) {
        
        NSURLSession.sharedSession().dataTaskWithURL(url) {
            (data, response, error) in
            
            if let error = error {
                print(error)
            }
            
            completion(data: data)
            
            }.resume()
        
    }
    
}