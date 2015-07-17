//: Playground - noun: a place where people can play

import UIKit

func SendNoticeTo(#aptNumber: Int) {
}

func FindApt(aptNumber: String) -> String? {
    let aptNumbers = ["101","202","303","404","505"]
    for tempAptNumber in aptNumbers {
        if (tempAptNumber == aptNumber) {
            return aptNumber
        }
    }
    
    return nil
}


if let culprit = FindApt("505")?.toInt() {
    SendNoticeTo(aptNumber: culprit)
}
