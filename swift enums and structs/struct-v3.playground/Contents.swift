// Struct - initializers

import UIKit

struct Contact {
    let firstName: String
    let lastName: String
    var type: String
    
    init(firstName: String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.type = "Friend"
    }
}

var person = Contact(firstName: "John", lastName: "Smith")

