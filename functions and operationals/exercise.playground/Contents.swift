//: Playground - noun: a place where people can play

import UIKit

//  1 Accepts two Int parameters
//  2 Figures out if the first is divisible by the second (no remainder)
//  3 Returns a Bool optional
//  4 If divisible, return true, else return nil
//  5 Call the function with 2 numbers and print "divisible" if it they are, or "not divisible" if they are not
// parts 1, 3
func IsDivisible(#dividend: Int, #divisor: Int) -> Bool? {
    // part 2
    if dividend % divisor == 0 {
        return true // part 4
    }
    return nil // part 4
}

// part 5
// Easier to do mupltiple tests against numbers
func CheckNumbers (#dividend: Int, #divisor: Int) {
    if let divisible = IsDivisible(dividend: dividend, divisor: divisor) {
        println("Divisible")
    }
    else {
        println("Not divisible")
    }
}

CheckNumbers(dividend: 10, divisor: 2) // Divisible
CheckNumbers(dividend: 10, divisor: 3) // Not Divisible