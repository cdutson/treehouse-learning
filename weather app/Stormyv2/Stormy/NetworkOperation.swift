//
//  NetworkOperation.swift
//  Stormy
//
//  Created by Corey Dutson on 2015-08-15.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import Foundation

class NetworkOperation {
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    typealias JSONDictionaryCompletion  = ([String: AnyObject]?) -> Void
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    
    typealias BlogPostCompletion = (NSData!, NSURLResponse!,NSError!) -> Void
    func fetchTreehouseBlogPosts (completion: BlogPostCompletion) {}
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
        
        let request: NSURLRequest = NSURLRequest(URL: queryURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            // check response for success (200)
            if let httpResponse = response as? NSHTTPURLResponse {
                // if successful, create JSON object with response data
                switch(httpResponse.statusCode) {
                case 200:
                    do {
                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject]
                        completion(jsonDictionary)
                    } catch {
                        // swallow error for now
                        print(error)
                    }
                default:
                    // TODO: do.. something here
                    print("GET not successful, code: \(httpResponse.statusCode) returned")
                }
            } else {
                // TODO: do.. something here
                print(" response was bad")
            }
        }
        
        dataTask.resume()
    }
}