//
//  ViewController.swift
//  Stormy
//
//  Created by Corey Dutson on 2015-08-03.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?

    
    private let forecastAPIKey = "7ad12f0a5da52a78796365cbf1e6d457"
    let coordinate: (lat: Double, long: Double) = (37.8267, -122.423)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) {
            (let currently) in
            if let currentWeather = currently {
                // update ui
                dispatch_async(dispatch_get_main_queue()) {
                    // execute closure
                    if let temperature = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(temperature)º"
                    }
                    if let humidity = currentWeather.humidity {
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    if let precipitation = currentWeather.precipProbability{
                        self.currentPrecipitationLabel?.text = "\(precipitation)%"
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
