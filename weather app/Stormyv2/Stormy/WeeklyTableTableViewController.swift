//
//  WeeklyTableTableViewController.swift
//  Stormy
//
//  Created by Corey Dutson on 2015-09-29.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import UIKit
import CoreLocation

class WeeklyTableTableViewController: UITableViewController, CLLocationManagerDelegate {

    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentWeatherIcon: UIImageView?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    @IBOutlet weak var currentTemperatureRangeLabel: UILabel?
    @IBOutlet weak var currentLocationLabel: UILabel?
    
    private let forecastAPIKey = "NOPE"
    var coordinate: (lat: Double, long: Double) = (37.8267, -122.423)
    var locManager:CLLocationManager!
    var locationStatus: String = ""
    
    var weeklyWeather: [DailyWeather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        locManager = CLLocationManager()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()

        //retrieveWeatherForecast()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return weeklyWeather.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCell")!
        
        let dailyWeather = weeklyWeather[indexPath.row]
        cell.textLabel?.text = dailyWeather.day
        
        return cell
    }
    
    func configureView() {
        tableView.backgroundView = BackgroundView()
        
        // change navbar text/weight/etc
        if let navBarFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
            let navBarAttributesDictionary: [String: AnyObject]? = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: navBarFont
            ]
            navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
        }
    }
    // MARK: - Weather Fetching
    
    func retrieveWeatherForecast() {
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) {
            (let forecast) in
            if let weatherForecast = forecast,
                let currentWeather = weatherForecast.currentWeather {
                // update ui
                dispatch_async(dispatch_get_main_queue()) {
                    // execute closure
                    if let temperature = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(temperature)º"
                    }
                    if let precipitation = currentWeather.precipProbability{
                        print("hey", precipitation)
                        self.currentPrecipitationLabel?.text = "Rain: \(precipitation)%"
                    }
                    if let icon = currentWeather.icon {
                        self.currentWeatherIcon?.image = icon
                    }
                    
                    self.weeklyWeather = weatherForecast.weekly
                    
                    if let highTemp = self.weeklyWeather.first?.maxTemperature,
                        let lowTemp = self.weeklyWeather.first?.minTemperature {
                            self.currentTemperatureRangeLabel?.text = "↑\(highTemp)º↓\(lowTemp)º"
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Location Fetching
    
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
                            print("Reverse geocoder failed with error" + error!.localizedDescription)
                            return
                        }
                        
                        if let pm = placemarks?.first {
                            if let aa = pm.locality {
                                city = aa
                            }
                            if let ab = pm.ISOcountryCode {
                                country = ab
                            }
                            if city.characters.count > 0 {
                                locName = city
                            }
                            if country.characters.count > 0 {
                                if locName.characters.count > 0 {
                                    locName = "\(locName), \(country)"
                                } else {
                                    locName = country
                                }
                                
                            }
                        } else {
                            print("Problem with the data received from geocoder")
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
            print(thing.lat)
            print(coordinate.lat)
            print(thing.long)
            print(coordinate.long)
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
    
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("hey error")
        print(error.description)
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
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("hey success")
        pollLocation()
    }
    
    // authorization status
    func locationManager(manager: CLLocationManager,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            print("hey auth")
            
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
    
    
}
