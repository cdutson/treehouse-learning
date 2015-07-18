// convenience initializers

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
    let designer: String
    
    init(title: String, price: Double, designer: String) {
        self.designer = designer
        super.init(title: title, price: price)
    }
    
    convenience init(title:String) {
        self.init(title: title, price: 99.00, designer: "dude")
    }
    
    override func DiscountedPrice(_ percentage: Double = 10.0) -> Double {
        return super.DiscountedPrice(percentage)
    }
}

var tshirt = Clothing(title:"Vintage")
tshirt.title
tshirt.price
tshirt.DiscountedPrice()
tshirt.size

let quadcopter = Product(title: "quad", price: 499.99)
