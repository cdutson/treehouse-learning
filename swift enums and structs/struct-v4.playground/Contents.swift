// Struct - initializers

import UIKit

struct Contact {
    var firstName: String
    var lastName: String
    var type: String
    
    init(fName: String, lName:String) {
        self.firstName = fName
        self.lastName = lName
        self.type = "Friend"
    }
    
    func FullName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
}

var person = Contact(fName: "John", lName: "Smith")
person.FullName()

person.firstName = "Corey"
person.lastName = "Dutson"
person.FullName()