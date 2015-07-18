// From Structs to Classes

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

let quadcopter = Product(title: "vroom", price: 499.99)
// quadcopter.price = 200 -- cannot due to let vs var

quadcopter.DiscountedPrice(10)
quadcopter.price
