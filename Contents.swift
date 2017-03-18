//: Playground - noun: a place where people can play

import UIKit

print("Hello World")


// Mark: var 與 let

var myVariable = 42
myVariable = 50

let myConstant = 50
// myConstant = 42  -->  Error message: Playground execution failed: error: SwiftTour.playground:8:12: error: cannot assign to value: 'myConstant' is a 'let' constant

// Mark: Type information with implicit 或是 explicit

let implicitInteger = 50
let implicitDouble = 50.0
let explicitInteger: Int = 80

let explicitFloat: Float = 4

// Explicit type casting

let label = "The width is: "
let width = 60
let widthLabel = label + String(width)

// let widthLabelError = label + width --> Playground execution failed: error: SwiftTour.playground:24:29: error: binary operator '+' cannot be applied to operands of type 'String' and 'Int'


// Mark: include value into a String 

let apples = 3
let oranges = 5
let applesummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruits"


let name = "Miss Huang"
let price: Float = 30.0
let hello = "Hello! \(name) , your breakfast is \(price), Have a good day!"

// Mark: Array & Dictionary


var shoppingList = ["catfish", "water", "battery", "bread"]

shoppingList[0]

for item in shoppingList {
    print(item)
}

var jobDescrition = ["John Wu": "Sales", "Alan Liu": "Engineer"]

jobDescrition["John Wu"]


// Mark: Create empty Array & Dictionay -> 宣告之後必需以 () 來產生

var shopingList = [String]()
var jobDescription = [String: String]()


var shoppingitem:String
var shoppingLists = [String]()  // 宣告內的是物件

shoppingitem = "catfish"
shoppingLists.append(shoppingitem)


// Array with Class defined object

class shopping_item {
    var name: String = ""
    var price: Double = 0.0
    var brand: String = ""
}

var shoppingLists1 = [shopping_item]()

var item1 = shopping_item()
item1.name = "item 1"
item1.price = 20.0
item1.brand = "WeiChun"

shoppingLists1.append(item1)


// Mark: Control Flow
/* 
    1. Condition : 
        a) if {} else {}  
        b) switch () { }
 
    2. loop :  
        a) for ~ in
        b) for , while
        c) repeat - while
 
 */


let individualScore = [75, 43, 103, 87, 12]
var scoreTeam = 0
for score in individualScore {
    if score > 50 {
        scoreTeam += 3
    } else {
        scoreTeam += 1
    }
}
print(scoreTeam)


// Mark: if let for optional binding
/*
    An optional value either contains a value or contains nil to indicate that the value is missing
    Put a ? after the type of the value to mark the value as optional
 */

var optionalString: String? = "Hello"
print(optionalString == nil)

//var optionalName:String? = "John AppleSeed"
var optionalName:String?
var greeting = "Hello"

if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting + "! May I have your name?"
}

// Mark: using ?? to handle the optional values to provide a default value. If the optional value is missing, the default value is used 

let nickName: String? = nil
let fullName: String = "John AppleSeed"

let informalGreeting = "Hi \(nickName ?? fullName)" // when nickName is missing useing full Name

// Mark: Switch

let vegetable = "red pepper"

switch (vegetable) {
    case "celery":
        print("Add some raisins and make ants on a leg.")
    case "cucumber", "watercress":
        print("That will make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("It should tasted spicy \(x)")
    default:
        print("Every taste good!")
}

// see how let x was used in this example

// Mark: for .. in loop ==> Array Example


let individuals = [75, 43, 103, 87, 12]
var passCount = 0
for score in individuals {
    if score > 60 {
        passCount += 1
    }
}
print(passCount)

// Mark: for .. in loop ==> Dictionary Example

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13,17,19],
    "Fibo": [1,1,2,3,5,8,13,21,34,55],
    "Square":[1,4,9,16,25,36]
]

var largest = 0
var largestType = ""

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestType = kind
        }
    }
}

print(largestType, largest)

// Mark: while loop

var n = 2
while n<100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 200
print(m)


// Mark: ..< and ...

var totalSum = 0
for i in 0...5
{
    totalSum += i
}
print(totalSum)

totalSum = 0
for i in 0..<5
{
    totalSum += i
}
print(totalSum)


// Mark: Function and Closure


func greet(person: String, day: String) -> String {
    
    return "Hello \(person) , Today is \(day)."
}


let greeting1 = greet(person: "Mr.Wu", day: "Saturday")
print(greeting1)

func calculate(scores: [Int]) -> (min: Int, max: Int, sum: Int, avg: Float)
{
    var maxNum = scores[0]
    var minNum = scores[0]
    var total = 0
    
    
    for score in scores {
        if score > maxNum {
            maxNum = score
        }
        if score < minNum {
            minNum = score
        }
        total += score
    }

    let avg  = Float(total/scores.count)
    return (minNum, maxNum, total, avg)
    
}

var staticsResult = calculate(scores: [5,3,100,6,7])
staticsResult.avg
staticsResult.max
staticsResult.min
staticsResult.sum

// let individuals = [75, 43, 103, 87, 12]
staticsResult = calculate(scores: individuals)
staticsResult.0  // min
staticsResult.1  // max
staticsResult.2  // sum
staticsResult.3  // average


// Marks: finctions take a variable number of arguments 

func sumOf(numbers: Int...)  -> (sum:Int, avg: Double) {
    var sum = 0
    var count = 0
    for number in numbers {
        sum += number
        count += 1
    }
    let avg = Double(sum/count)
    return (sum, avg)
}

//sumOf()
sumOf(numbers: 1,2,3,4,5,6)

// Mark: Nested function  function inside of function 

func returnFifteen() -> Int {
    
    var y = 10
    func add() {
        y += 5
    }
    
    add()
    return y
}

returnFifteen()

// Mark: A function can return another function as its value

func makeIncrementer() -> ((Int) -> Int) {
    
    func addOne(number: Int) -> Int {
        return number + 1
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(7)

// Mark: A function can take another functions as one of its arguments


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}


func lessThanNumber(number: Int) -> Bool {
    return number < 20
}
// let individuals = [75, 43, 103, 87, 12]

hasAnyMatches(list: individuals, condition: lessThanNumber)

// Mark: Functions are a special case of closures: blocks of code that can be called later.

// Mark: Closure : a code without a name by surroundin code with ({ parameters  in   code   })


individuals.map({ (number: Int) -> Int  in
  let result = 3 * number
  return result
})


let mappedIndividuals = individuals.map({ number in 3*number })
print(mappedIndividuals)

// Can refer to parameter by number instead of by name 

var sortedindividuals = individuals.sorted{ $0 > $1 }
print(sortedindividuals)

sortedindividuals = individuals.sorted{ $0 < $1 }
print(sortedindividuals)



// Mark: A func to compare the Dictionay value with 比對數字之條件

 let interestingDict = [
 "A": [2,3,5,7,11,13,17,19],
 "B": [1,1,2,3,5,8,13,21,34,55],
 "C":[1,4,9,16,25,36]
 ]
 
func search(dicts: [String: [Int]], numberset: Int) ->  [[String:Int]] {
    
    // numberset 是比對條件
    
    var returnArray = [[String: Int]]()
    for (kind, numbers) in dicts {
        for number in numbers {
            if number ==  numberset {
                returnArray.append([kind:number])
            }
        }
    }
    return returnArray
}

search(dicts: interestingDict, numberset: 3)


//  Mark: Objects and Classes

// Class basic

class Shape {
    
    var numberOfSides = 0;
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides"
    }
}


var shape1 = Shape()
shape1.numberOfSides = 7
shape1.simpleDescription()


// init()

class NamedShape {
    var numberOfSides: Int = 0;
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides"
    }
}

// override & inherience 

class Square: NamedShape {
    
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with side of Length \(sideLength)"
    }
    
}

let testSquare = Square(sideLength: 20.0, name: "Test Square")
testSquare.area()
testSquare.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return M_PI * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius of  \(radius)"
    }
    
}

let testCircle = Circle(radius: 10, name: "My Test Circle")
testCircle.area()
testCircle.simpleDescription()

// Mark: Class getter & Setter

class Triangle: NamedShape {
    
    var  sideLength: Double = 0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3 * sideLength
        }
        set {
            sideLength = newValue/3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "A triangle with side of length  \(sideLength)"
    }
    
}

var myTriangle = Triangle(sideLength: 30, name: "My Triangle")
myTriangle.perimeter

myTriangle.perimeter = 102
myTriangle.sideLength


// Optional of Class

/*
 
    When working with optional values, you can write ? before operations like method, properties and subscripting..
 
 
 */

let optionalSquare: Square? = Square(sideLength: 30, name: "Optional Square")
optionalSquare?.sideLength
optionalSquare?.area()


// Mark: Enumerations and Structures
