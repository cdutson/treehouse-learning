// Dictionary

import UIKit


//  Code        Country name
//  or
//  Key         Value
//  CA          Canada
//  BE          Belgium
//  FR          France
//  DE          Germany
//  UK          United Kingdom
//  US          United States

var countries = [
    "CA": "Canada",
    "BE": "Belgium",
    "FR": "France",
    "DE": "Germany",
    "UK": "United Kingdom",
    "US": "United States"
]

countries["CA"]

countries["FF"] = "Fweep fweep"
countries

countries["US"] = "United States of America"
countries

let item = countries.removeValueForKey("FF")
item
countries