//
//  ViewController.swift
//  Stormy
//
//  Created by Corey Dutson on 2015-08-03.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var currentLocationLabel: UILabel?
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    @IBOutlet weak var currentWeatherIcon: UIImageView?
    @IBOutlet weak var currentWeatherSummary: UILabel?
    @IBOutlet weak var refreshButton: UIButton?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    
    private let forecastAPIKey = "NOPELOL"
    var coordinate: (lat: Double, long: Double) = (37.8267, -122.423)
    var locManager:CLLocationManager!
    var locationStatus: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locManager = CLLocationManager()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()

        //retrieveWeatherForecast()
    }
    
    func getLocation() -> (lat: Double, long: Double)? {
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways){
                if let currentLocation = locManager!.location {
                    return (lat: currentLocation.coordinate.latitude, long: currentLocation.coordinate.longitude)
                }
        }
        return nil
    }
    
    func getLocationName(completion: (String) -> Void) -> Void {
        var city = ""
        var country = ""
        var locName = ""
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways){
                if let currentLocation = locManager!.location {

                    CLGeocoder().reverseGeocodeLocation(currentLocation, completionHandler: {(placemarks, error)-> Void in
                        if (error != nil) {
                            println("Reverse geocoder failed with error" + error.localizedDescription)
                            return
                        }
                        
                        if placemarks.count > 0 {
                            let pm = placemarks[0] as! CLPlacemark
                            if let aa = pm.locality {
                                city = aa
                            }
                            if let ab = pm.ISOcountryCode {
                                country = ab
                            }
                            if count(city) > 0 {
                                locName = city
                            }
                            if count(country) > 0 {
                                if count(locName) > 0 {
                                    locName = "\(locName), \(country)"
                                } else {
                                    locName = country
                                }
                                
                            }
                        } else {
                            println("Problem with the data received from geocoder")
                        }
                        completion(locName)
                    })
                }
        }
    }
    
    func updateLocationName(name: String?) {
        if let newName = name {
            currentLocationLabel!.text = newName
        }
    }
    
    func pollLocation() {
        if let thing = getLocation() {
            // the lamest caching
            println(thing.lat)
            println(coordinate.lat)
            println(thing.long)
            println(coordinate.long)
            if thing.lat != coordinate.lat || thing.long != coordinate.long {
                coordinate = (lat: thing.lat, long: thing.long)
                getLocationName() {
                    (let locName) in
                    self.updateLocationName(locName)
                    self.retrieveWeatherForecast()
                }

            }
        }
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("hey error")
        println(error.description)
        let actionSheetController: UIAlertController = UIAlertController(title: "Error", message: "There was a problem getting your location. Have you enabled location services for this app?", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        
        let openSettingsAction: UIAlertAction = UIAlertAction(title: "Open settings", style: .Default) { action -> Void in
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        }
        actionSheetController.addAction(openSettingsAction)
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    // if success
    // Assumptions: locations is an array, locationObj is a CLLocation
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("hey success")
        pollLocation()
    }
    
    // authorization status
    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            println("hey auth")
            
            switch status {
            case CLAuthorizationStatus.Restricted:
                locationStatus = "Restricted Access"
            case CLAuthorizationStatus.Denied:
                locationStatus = "User denied access"
            case CLAuthorizationStatus.NotDetermined:
                locationStatus = "Status not determined"
            default:
                locManager.startUpdatingLocation()
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func refreshWeather() {
        toggleRefreshAnimation(true)
        retrieveWeatherForecast()
    }
    
    
    func retrieveWeatherForecast() {
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
                    if let icon = currentWeather.icon {
                        self.currentWeatherIcon?.image = icon
                    }
                    if let summary = currentWeather.summary {
                        self.currentWeatherSummary?.text = summary
                    }
                    self.toggleRefreshAnimation(false)
                }
            }
        }
    }
    
    func toggleRefreshAnimation(on: Bool) {
        refreshButton?.hidden = on
        if on {
            activityIndicator?.startAnimating()
        } else {
            activityIndicator?.stopAnimating()
        }
    }
}
