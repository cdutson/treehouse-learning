//: Closures

// This function takes a string and prints it

func printString(aString: String) {
    println("Pringing the string passed in: \(aString)")
}


printString("Hello")

/*
    Assign the function we just declared
    to a constant. Note that we do not
    add parentheses "()" after the function
    name.
*/
let someFunction = printString

someFunction("blong")


func displayString(printStringFunc: (String) -> Void) {
    printStringFunc("I'm a function inside another function")
}

displayString(printString)


// Using the filter function
let allNumbers = [1,2,3,4,5,6,7,8,9,10]

func isEvenNumber(i: Int) -> Bool {
    return i % 2 == 0
}

let ifEven = isEvenNumber

let evenNumbers = allNumbers.filter(ifEven)



// capturing variables

// returning functions
func printerFunction() -> (Int) -> () {
    var runningTotal = 0
    func printInteger(number:Int) {
        runningTotal += 10
        println("The running total is:  \(runningTotal)")
    }
    
    return printInteger
}

// Jesus, really?
let printAndReturnIntegerFunc = printerFunction()

printAndReturnIntegerFunc(2)
printAndReturnIntegerFunc(2)
printAndReturnIntegerFunc(2)



let runningTotalFunction = printerFunction()

runningTotalFunction(1)
printAndReturnIntegerFunc(2)
runningTotalFunction(1)


func differenceBetweenNumbers(a: Int, b:Int) -> (Int) {
    return a - b
}


func mathOperation(mathFunc: (Int, Int) -> Int, a: Int, b: Int) -> Int {
    return mathFunc(a,b)
}

let difference = mathOperation(differenceBetweenNumbers, 1, 2)

