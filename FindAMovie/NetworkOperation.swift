import Foundation
import Alamofire
import SwiftyJSON

enum NetworkError: ErrorType {
    case NetworkFailure
    case EmptyResult
}

/**
 *  Network Operation class to perform webservice request
 */
class NetworkOperation {
    
    let queryURL: String
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?, ErrorType?) -> (Void)
    
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
    func executeRequest(completionHandler: JSONDictionaryCompletion) {
        
        Alamofire
            .request(.GET, self.queryURL)
            .responseJSON {
                (response) in
                
                switch response.result {
                case .Success:
                    guard let value = response.result.value else {
                        return completionHandler(nil, NetworkError.EmptyResult)
                    }
                    
                    let jsonDictionary = value as? [String: AnyObject]
                    completionHandler(jsonDictionary, nil)
                    
                case .Failure(let error):
                    print(error)
                    completionHandler(nil, NetworkError.NetworkFailure)
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