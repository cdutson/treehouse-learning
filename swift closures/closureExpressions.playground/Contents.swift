// closure expressions

func doubler(number: Int) -> Int {
    return number * 2
}

let doubleFunction = doubler
doubleFunction(2)

let numbers = [1,2,3,4,5]
let doubledNumbers = numbers.map(doubleFunction)

// using closure expressions with the map function
let tripledNumbers = numbers.map({(i:Int) -> Int in return i * 3})

// using closure expressions withthe sorted function
var names = ["adam","john", "martha", "Jayquelen", "A A ron"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

// sorted(names, backwards)

let sortedNames = sorted(names, {(s1: String, s2: String) -> Bool in s1 > s2})

sortedNames

// closure shorthand syntax

let tripleFunction = {(i: Int) -> Int in return i * 3}
//[1,2,3,4,5].map(tripleFunction)

// rule 1 - if it's just a single transform, just pass it directly
[1,2,3,4,5].map({(i: Int) -> Int in return i * 3})

// rule 2 - infer type from context
[1,2,3,4,5].map({i in return i * 3})
// note, just cause you can infer, doesn't mean you should. readability vs susinctness

// rule 3 - implicit returns from single expression closures
[1,2,3,4,5].map({i in i * 3})

//rule 4 - shorthand arg nmes
[1,2,3,4,5].map({$0 * 3})

//rule 5 - trailing closures (for when your function is too damned long)
[1,2,3,4,5].map() {$0 * 3}

[1,2,3,4,5].map() {
    (var digit) -> Int in
    if digit % 2 == 0 {
        return digit / 2
    }
    else {
        return digit
    }
}

// rule 6 - ignoring parentheses (Okay, this is gross. Is this worth saving the two chars?)
[1,2,3,4,5].map {$0 * 3}