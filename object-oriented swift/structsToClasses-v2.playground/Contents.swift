// From Structs to Classes

import UIKit

class Product {
    let title: String
    let price: Double
    
    init(title: String, price:Double) {
        self.title = title
        self.price = price
    }
}

let quadcopter = Product(title: "vroom", price: 2)
// quadcopter.price = 200 -- cannot due to let vs var
