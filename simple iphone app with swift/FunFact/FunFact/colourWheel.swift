//
//  colourWheel.swift
//  FunFact
//
//  Created by Corey Dutson on 2015-07-23.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import Foundation
import UIKit

struct ColourWheel {
    let colorsArray = [
        UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0), //teal color
        UIColor(red: 222/255.0, green: 171/255.0, blue: 66/255.0, alpha: 1.0), //yellow color
        UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0), //red color
        UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0), //orange color
        UIColor(red: 77/255.0, green: 75/255.0, blue: 82/255.0, alpha: 1.0), //dark color
        UIColor(red: 105/255.0, green: 94/255.0, blue: 133/255.0, alpha: 1.0), //purple color
        UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0), //green color
    ]
    
    func RandomColour() -> UIColor {
        var arrayCount = UInt32(colorsArray.count)
        var randomNumber = arc4random_uniform(arrayCount)
        return colorsArray[Int(randomNumber)]
    }
}