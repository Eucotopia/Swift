//
//  main.swift
//  SwiftTour
//
//  Created by LIWEI on 2024/2/2.
//

import Foundation
// Prints "Hello World"
print("Hello, World!")



// 使用 let 定义常量，var 定义变量
var myVariable = 42
myVariable = 0
let myConstant = 42

// 自动推断
let implicitInteger = 70
let implicitDouble = 70.0
// 手动置顶类型
let explicitDouble:Double = 70

let a:Float = 4

let label = "The width is"
let width = 94

// 不会进行隐式类型转换
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples+oranges) pieces."


let quotation = """
    Even though
    I still have \(apples+oranges) pieces of fruit
"""


var fruits = ["strawberries","limes","tangerines"]
fruits[1] = "grapes"

var occupations = [
    "Malcolm":"Captain",
    "Kaylee":"Mechanic",
]

print(occupations["Malcolm"] ?? "没有")

fruits.append("blueberries")
print(fruits)



// 创建一个空的数组
fruits = []
// 创建一个空的字典
occupations = [:]

//let emptyArray:String = []

let emptyDictionary:[String:Float] = [:]


let individualScores = [75,43,103,87,12]
var teamScore = 0


// 遍历操作
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}
print(teamScore)

let scoreDecoration = if teamScore > 10 {
    "🤩"
}else{
    "🥳"
}
print("Scores:\(teamScore),\(scoreDecoration)")

// nil 表示缺省值
var optionalString:String? = "Hello"
print(optionalString == nil)


let nickname:String? = nil
let fullName:String = "John Appleseed"
// ?? 表示 nickname 如果缺省则显示后面的值，否则显示 nickname
let infomalGreeting = "Hi \(nickname ?? fullName)"

print(infomalGreeting)
if let nickname{
    print("Hey,\(nickname)")
}


let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber","watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    // 匹配结束
    print("is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


let interestingNumbers = [
    "Prime":[2,3,4,5,6,7],
    "Fibonacci":[211,32,43,45,65,67],
    "Square":[42,33,94,85,76,70],
]

var largest = 0
for (index,numbers) in interestingNumbers{
    for number in numbers {
        if number > largest{
            largest = number
        }
    }
}
print(largest)

var n = 2
while n < 100{
    n*=2
}
print(n)

var m = 2
repeat{
    m*=2
}while m<100


var total = 0
// 小于4
for i in 0..<4{
    total += i
}
print(total)
// 定义函数
func greet(person:String,day:String)->String{
    return "Hello \(person),today is \(day)"
}

print(greet(person: "Faker", day: "11"))

func greet(_ person:String,on day:String)->String{
    return "Hello \(person),today is \(day)"
}
print(greet("John",on: "wednesday"))

func calculateStatistics(scores:[Int])->(min:Int,Max:Int,sum:Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score>max{
            max = score
        }else if score < min{
            min = score
        }
        sum += score
    }
    // 返回的实际上是一个对象
    return(min,max,sum)
}
print(calculateStatistics(scores: [1,2,3,4,5,6,7,8,9,10]))


func returnFifteen()->Int{
    var y = 10
    func add(){
        y+=5
    }
    add()
    return y
}
print(returnFifteen())
// 返回值可以是任何东西，包括函数
func makeIncrementer()->((Int)->Int){
    func addOne(number:Int)->Int{
        return 1+number
    }
    return addOne
}
var increment:(Int)->Int  = makeIncrementer()
print(increment(7))
// 当你需要判断一个常量的某些逻辑时，可以这么做
func hasAnymetches(list:[Int],condition:(Int)->Bool)->Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen(number:Int)->Bool{
    return number < 10
}

var numbers = [20,19,7,12]
print(hasAnymetches(list: numbers, condition: lessThanTen))

// 进行更改后重新赋值
print(numbers.map({(number:Int)->Int in
    let result = 3 * number
    return result
}))
let mappedNumbers  = numbers.map({ number in 3 * number})

print(mappedNumbers)


// 排序
let sortedNumbers = numbers.sorted(by: >)

print(sortedNumbers)

// 类
class Shape {
    var numberOfSides = 0
    func simpleDescription()->String{
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
print(shape.simpleDescription())


class NamedShape {
    var numberOfSides: Int = 0
    var name :String
    init(name:String){
        self.name = name
    }
    func simpleDesciption()->String{
        return "A shape with \(numberOfSides) sides."
    }
    func printName()->String{
        return "name is:\(self.name)"
    }
}

print(NamedShape(name:"Faker").simpleDesciption())
print(NamedShape(name:"Faker").printName())

class Square:NamedShape{
    var sideLength:Int
    init(name:String,sideLength:Int){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area()->Int{
        return sideLength * sideLength
    }
    override func simpleDesciption() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

print(Square(name: "my test square", sideLength: 5).area())

class EquilateralTriangle:NamedShape{
    var sideLength:Double = 0.0
    init(sideLength: Double,name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter:Double{
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue/3.0
        }
    }
}

print(EquilateralTriangle(sideLength: 5.2, name: "Faker").perimeter)

enum Rank:Int{
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription()->String{
        switch self{
        case .ace:
            return "ac3"
        case .jack:
            return "java"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
print(aceRawValue)

if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}


enum ServerResponse {
    case result(String,String)
    case failure(String)
}
let success = ServerResponse.result("6:00", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}


func getchUserId(from server:String) async -> Int{
    if server == "primary"{
        return 97
    }
    return 501
}

func fetchUsername(from server:String) async -> String{
    let userId = await getchUserId(from: server)
    if userId == 501 {
        return "John Appleseed"
    }
    return "Guest"
}


// 并发、协议、错误处理
