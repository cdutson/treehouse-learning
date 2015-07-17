//: Playground - noun: a place where people can play

import UIKit

func FindApt(aptNumber: String) -> String? {
    let aptNumbers = ["101","202","303","404","505"]
    for tempAptNumber in aptNumbers {
        if (tempAptNumber == aptNumber) {
            return aptNumber
        }
    }
    
    return nil
}

// let culprit = FindApt("505")
// culprit! // unwrap an optional


if let culprit = FindApt("502") {
    println("Apt Found: \(culprit)")
}
