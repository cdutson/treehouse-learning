// Assignment

/*
- Create a base class called Shape which will have 2 properties: sides and name
- Create a subclass called Square, it will also have 2 properties called: sideLength and area.
- The area property will be a computed property with getter and setter methods.
- Add a designated initializer to Square which accept all three properties: sides, name and sideLength
- Add a convenience initializer to Square that will accept only the sideLength and provide default values. 4 for sides and “Square” for name
- Create an instance of Square using the convenience initializer
*/

import UIKit

class Shape {
    let sides: Int
    let name: String
    
    init (sides: Int, name: String) {
        self.sides = sides
        self.name = name
    }
}

class Square: Shape {
    var sideLength: Double
    var area: Double {
        // This is dumb.
        get {
            return sideLength * sideLength
        }
        set {
            sideLength = sqrt(newValue)
        }
    }
    
    init (sides: Int, name: String, sideLength: Double) {
        self.sideLength = sideLength
        super.init(sides: sides, name: name)
    }
    
    convenience init (_ sides: Int = 4, _ name: String = "Square", sideLength: Double) {
        self.init(sides: sides, name: name, sideLength: sideLength)
    }
}

// get things started
var sampleSquare = Square(sideLength:10)

// Check everything is set
sampleSquare.sides // pass
sampleSquare.name // pass
sampleSquare.sideLength // pass
sampleSquare.area// pass

// screw with area first
sampleSquare.area = 90
sampleSquare.area // pass
sampleSquare.sideLength // pass

// reset
sampleSquare.area = 100
sampleSquare.sideLength // pass

// change side length
sampleSquare.sideLength = 12
sampleSquare.sideLength // pass
sampleSquare.area // pass
