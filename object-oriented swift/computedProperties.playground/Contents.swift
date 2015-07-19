// computed properties

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

class Furniture: Product {
    let height: Double
    let width: Double
    let length: Double
    var surfaceArea: Double {
        return width*length
    }
    
    init(title: String, price:Double, height: Double, width: Double, length:Double) {
        self.height = height
        self.width = width
        self.length = length
        
        super.init(title:title, price: price)
    }
}

let chair = Furniture(title: "chair", price: 49.99, height: 10, width: 5, length: 12)
chair.surfaceArea