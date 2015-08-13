//
//  ViewController.swift
//  Stormy
//
//  Created by Corey Dutson on 2015-08-03.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTempratureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPercipitationLabel: UILabel?
    
    private let forecastAPIKey = "Nope lol"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        // dat aobj to fetch weather data
        //let weatherData = NSData(contentsOfURL: forecastURL!, options: nil, error: nil) -- bad
        
        //use nsurlsession to fetch data
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        // request obj
        let request = NSURLRequest(URL: forecastURL!)
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            println(data)
        })
        
        // This creates an async call with a callback (as shown above)
        dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

