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
    var width: Double
    var length: Double
    var surfaceArea: Double {
        get {
            return width * length
        }
        set {
            // assume square things because dumb
            length = sqrt(newValue)
            width = sqrt(newValue)
        }
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
chair.width = 100
chair.length = 13244
chair.surfaceArea