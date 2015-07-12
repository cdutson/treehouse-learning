//: Playground - noun: a place where people can play

import UIKit

var todo: [String] = ["Return calls", "Write Blog", "Cook Dinner", "Pickup Laundry", "Buy bulbs"]

println(todo[0])
println(todo[1])
println(todo[2])
println()

for item in todo {
    println(item)
}

println()
for number in 1...10 {
    println("\(number) times 2 is \(number*2)")
}

println()
// Non-inclusive. never seen this before
for number in 1..<10 {
    println("\(number) times 2 is \(number*2)")
}