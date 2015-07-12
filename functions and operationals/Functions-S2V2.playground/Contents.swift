// Tuple

import UIKit

func SearchNames(#name: String) -> (Bool, String) {
    let names = ["Amit", "Andrew", "Ben", "Craig", "Dave", "Guil", "Hampton", "Jason", "Joy", "Kenneth", "Nick", "Pasan", "Zac"]
    
    var found = (false, "\(name) is not a treehouse teacher")
    
    for n in names {
        if n == name {
            found = (true, "\(name) is a treehouse teacher")
            break // Not in demo, but come on, more efficient
        }
    }
    
    return found
}


SearchNames(name: "John") // false
let results = SearchNames(name: "Joy") // true

results.0
results.1


// This is bad, yo
if results.0 {
    // grant acces
}
else {
    // access denied
}