//iOS Closures

import UIKit
// example uiview anumation closures

let someLabel = UILabel()

UIView.animateWithDuration(1.0, animations: {() -> Void in
    // carry out animation
    someLabel.alpha = 0.3
    }) {(failure: Bool) -> Void in
        // when animation completes, execute this closure
}

// example 2: making a network request

let session = NSURLSession(configuration:NSURLSessionConfiguration.defaultSessionConfiguration())
let url = NSURL(string: "http://blog.teamtreehouse.com/api/get_recent_summary/?count=20")
let request = NSURLRequest(URL: url!)

let downloadTask = session.downloadTaskWithRequest(request, completionHandler: { (url: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
    //execute body of enclosure
})


let someOtherDownloadTask = session.downloadTaskWithRequest(request) { (let url, let response, let error) in
    //execute body of enclosure
}

downloadTask.resume()

// Type alias
typealias JSONDictionaryCompletion = ([String:AnyObject]?) -> ()

func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
}

func getRecentBlogPosts(completion: (NSURLResponse! -> Void)) {
    let treehouseDownloadTask = session.downloadTaskWithRequest(request) {
        (let url, let response, let error) in
        completion(response)
    }
}


getRecentBlogPosts {
    (let response) in
    // Start body of method
}