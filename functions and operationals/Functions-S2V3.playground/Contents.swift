// Tuple

import UIKit

// old
// func SearchNames(#name: String) -> (Bool, String) {
// new
func SearchNames(#name: String) -> (found: Bool, desription: String) {
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
let (_, description) = SearchNames(name: "Joy") // true

let result = SearchNames(name: "Andrew")

// as a result of the new way
result.found
result.desription

// Extra Credit
// Write a function that accepts a Dictionary as parameter and returns a named tuple. 
// The dictionary should contain the following keys: title, artist and album

// Unsure why I need the ? in this so far.
func sample(songDict: [String: String]) -> (title:String?, artist:String?, album: String?) {
    return (songDict["title"], songDict["artist"], songDict["album"])
}