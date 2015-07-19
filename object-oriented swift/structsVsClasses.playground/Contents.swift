// Structs vs classes

import UIKit

// Bad naming convention
class ProductClass {
    var title: String
    var price: Double = 0.0
    
    init(title:String, price:Double) {
        self.title = title
        self.price = price
    }
}

var phoneClass = ProductClass(title: "iphone 6", price: 800)
var bigPhoneClass = phoneClass
bigPhoneClass.title
bigPhoneClass.title = "iphone 6+"
// Note the reference instead of value. bigPhoneClass points to phoneClass, not an instance of
phoneClass.title

struct ProductStruct {
    var title: String
    var price: Double = 0.0
}

var phoneStruct = ProductStruct(title: "nexus 5", price: 500)
var bigPhoneStruct = phoneStruct

bigPhoneStruct.title
bigPhoneStruct.title = "nexus 6"
phoneStruct.title