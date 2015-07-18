// Method overriding

import UIKit

class Product {
    let title: String
    var price: Double
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
    
    func DiscountedPrice(percentage: Double) -> Double {
        return price - (price * percentage / 100)
    }
}

enum Size {
    case Small, Medium, Large
    init() {
        self = .Small
    }
}

class Clothing: Product {
    var size = Size()
    
    override func DiscountedPrice(_ percentage: Double = 10.0) -> Double {
        return super.DiscountedPrice(percentage)
    }
}

var tshirt = Clothing(title: "Vintage", price: 49.99)
tshirt.title
tshirt.price
tshirt.DiscountedPrice()
tshirt.size

let quadcopter = Product(title: "quad", price: 499.99)
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
