// Comparison

import UIKit

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

var distance = 100


if distance < 5 {
    println("\(distance) miles is near")
}
else if distance >= 5 && distance <= 20 {
    println("\(distance) miles is close")
}
else {
    println("\(distance) miles is far")
}


if distance > 5 || distance < 20 {
    println("OR")
}