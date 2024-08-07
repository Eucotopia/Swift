import Cocoa
import Foundation
// --------------------------常量和变量--------------------------
// let -> 常量 -> 不可修改
// var -> 变量 -> 可修改

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
currentLoginAttempt = 20

// 一行可以同时声明多个常量或者变量
var x = 0.0, y = 0.0, z = 0.0
let a = 0.0, b = 0.0, c = 0.0


// 声明 String 类型的变量
var welcomeMessage: String
welcomeMessage = "hello"

// 声明多个相同类型的变量
var red, green, blue: Double

// 常量和变量的命名方式几乎包含所有的字符
//
let π = 3.1415
let 你好 = "你好世界"
let 🐮 = "ye"
//func print(
//    _ items: Any...,
//    separator: String = " ",
//    terminator: String = "\n"
//)
// 显然，print 可以同时打印多个值，并且通过 separator 进行分割，当所有的 item 都被打印后，会打印 terminator
print(你好)
print("你好","Swift",separator: "-",terminator: "!")

let count = 20
// 插值语法
print("I have \(count) apples")


// --------------------------注释--------------------------
// 单行注释
/*
  多行注释
 */
/*
 /*
  嵌套的多行注释
  */
 */



// --------------------------整数--------------------------

var minValue = UInt8.min  // 0
var maxvalue = UInt8.max  // 255

// 1 表示负数，0 表示正数
var g = Int8.min // 10000000
var f = Int8.max // 01111111

// --------------------------浮点数--------------------------
// 浮点数是有小数部分的数字，比如 3.14159、0.1 和 -273.15
// Double 表示 64 位浮点数
// Float 表示 32 位浮点数

// 类型推断，Int
let meaningOfLife = 42

// Swift 会推断为 Double 型，而不是 Float
var pi = 3.14159

// Double
let anotherPi = 3 + 0.14159

let decimalInteger = 17
let binaryInteger = 0b10001
let octaInteger = 0o21
let hexadecimalInteger = 0x11

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1


let twoThousand: UInt16 = 2_000
let ont: UInt8 = 1
// twoThousandAndOne -> UInt16
// UInt16(ont) 强制类型转换
let twoThousandAndOne = twoThousand + UInt16(ont)

print(type(of: twoThousand))

let three = 3
let pointOneFourOneFiveNine = 0.14159
pi = Double(three) + pointOneFourOneFiveNine
// Double -> Int 会导致精度丢失
let integetrPi = Int(pi)


typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min


let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}


//let i = 1
//if i {
//    // 这个例子无法通过编译
//}

let i = 1
if i == 1 {

}


// 类型（Int, String）
let http404Error = (404,"Not Found")

// 分解
let (statusCode, statusMessage) = http404Error

print("statusCode:",statusCode,",","statusMessage:",statusMessage)


let (justTheStatusCode,_) = http404Error
print("The status code is \(justTheStatusCode)")


print("the status code is \(http404Error.0)")
print("the status message is \(http404Error.1)")


let http200Status = (statusCode:200, description:"OK")

print("ths status code is \(http200Status.statusCode)")
print("ths status description is \(http200Status.description)")


let possibleNumber = "123"
// 此时 convertedNumber 被推断为 Int？ 或者 optional Int
// possibleNumber 是 String 类型，但是并无法确定它是否可以被强转 Int
let convertedNumber = Int(possibleNumber)


var serverResponseCode:Int? = 404
// 表示不包含值
serverResponseCode = nil

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!


let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号



func canThrowAnError() throws{
    // 这个函数可能跑出错误
}

do {
    try canThrowAnError()
} catch {
    // 有一个错误抛出
}


let age = -3
assert(age >= 0 ,"A person's age cannot be less than zero")
assert(age >= 0)


//先决条件，false 执行后面的内容
//precondition(index > 0,"Index must be greater than zero.")
