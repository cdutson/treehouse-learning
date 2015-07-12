//: Playground - noun: a place where people can play

import UIKit

let cap = 100

for var i = 1; i <= cap; i++ {
    var str = ""
    if i % 3 == 0 {
        str += "fizz"
    }
    if i % 5 == 0 {
        str += "Buzz"
    }
    if str == "" {
        str = String(i)
    }
    
    println("\(str)")
}
