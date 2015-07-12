//: Playground - noun: a place where people can play

import UIKit

func CalculateArea(#height: Int, #width: Int) -> Int {
    return height * width
}

println("Area equals \(CalculateArea(height: 12, width:10))")

CalculateArea(height:1000, width:1200)