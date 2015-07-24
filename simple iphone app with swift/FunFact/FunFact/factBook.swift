//
//  factBook.swift
//  FunFact
//
//  Created by Corey Dutson on 2015-07-23.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import Foundation

struct FactBook {
    
    let factsArray = [
        "This is a fact",
        "This is also a fact",
        "This is a third fact",
        "And here is fact number 4"
    ]
    
    func randomFact() -> String {
        var arrayCount = UInt32(factsArray.count)
        var randomNumber = arc4random_uniform(arrayCount)
        return factsArray[Int(randomNumber)]
    }
}