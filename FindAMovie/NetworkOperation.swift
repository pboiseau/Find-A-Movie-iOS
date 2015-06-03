import Foundation
import Alamofire

class NetworkOperation {
    
    let queryURL: String
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]? -> Void)
    
    init(url: String) {
        self.queryURL = url
    }
    
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
                }
        }
        
    }
    
}