//: functions

import UIKit

println("Swift functions")

func CalculateArea(height: Int, width: Int) -> Int {
    return height * width
}

println("Area equals \(CalculateArea(12, 10))")

CalculateArea(1000, 1200)


// EXTRA CREDIT
// Write a function called fullName which takes two String parameters: firstName and lastName. 
// It concatenates the two parameters and returns them as the fullName.

func fullName(firstName: String, lastName: String) -> String {
    return "\(firstName)\(lastName)"
}

println(fullName("Corey", "Dutson"))
