//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Corey Dutson on 2015-08-03.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let temprature: Int
    let humidity: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String: AnyObject]) {
        temprature = weatherDictionary["temperature"] as! Int
        let humidityFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityFloat * 100)
        let precipProbabilityFloat = weatherDictionary["precipProbability"] as! Double
        precipProbability = Int(precipProbabilityFloat * 100)
        summary = weatherDictionary["summary"] as! String
    }
}