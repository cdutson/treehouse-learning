// computed properties

import UIKit

class Product {
    let title: String
    var price: Double = 0.0
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
    
    func DiscountedPrice(percentage: Double) -> Double {
        return price - (price * percentage / 100)
    }
}

class Electronic: Product {
    var batteries: Bool?
}

let toy = Electronic(title: "thing", price: 79)
toy.batteries = true

if let batteries = toy.batteries {
    if batteries {
        println("Batteries included")
    }
}