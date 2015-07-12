//: Playground - noun: a place where people can play

import UIKit

let height = 12 // In feet
let width = 10  // In feet

let area = height * width

// 1sq. meter = 1 sq. foot  / 10.764
let area_in_meters = Double(area) / 10.764

let chair_width = 3
let space_remaining = width % chair_width
let chairs = width / chair_width

