// Struct - initializers

import UIKit

struct Contact {
    let firstName: String
    let lastName: String
    var type: String = "Friend"
}

var person = Contact(firstName: "John", lastName: "Smith", type:"Friend")

