//: Playground - noun: a place where people can play

import UIKit

var todo: [String] = ["Return calls","Write a blog post"," Cook dinner"]

todo += ["Pickup laundry", "vroom"]

todo[0]

todo.count

todo.append("beep boop")

todo[2] = "Clean dishes"
todo

let item = todo.removeLast()
item

let item2 = todo.removeAtIndex(1)
item2

todo

todo.insert("new thing", atIndex: 0)
