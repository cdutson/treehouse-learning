// Inheritance

import UIKit

class Product {
    let title: String
    var price: Double
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
    
    func DiscountedPrice(percentage: Double) {
        // if no conflict, you don't need to use self for local variables. neat
        price = price - (price * percentage / 100)
        
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
}

var tshirt = Clothing(title: "Vintage", price: 49.99)
tshirt.title
tshirt.price
tshirt.DiscountedPrice(10)
tshirt.size

let quadcopter = Product(title: "quad", price: 499.99)
