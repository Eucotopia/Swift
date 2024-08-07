

let b = 10
var a = 5
a = b


let (x,y) = (1,2)
print(x,y)

1 + 2
5 - 3
2 * 3
10.0 / 2.5
"hello, " + "world"

9 % 4
// 当对负数求余时，忽略后者的符号
9 % -4

let three = 3
let minusThree = -three
let plusThree = -minusThree

let minusSix = -6
// 一元正号不会有任何改变
let alsoMinusSix = +minusSix

var p = 1
p += 2

1 == 1
1 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
    print("hello,world")
}else{
    print("I'm sorry \(name),but I don't recognize you")
}


(1,"zebra") < (2,"apple")
(3,"apple") < (3,"bird")
(4,"dog") == (4,"dog")


let contentHeight = 40
let hasheader = true
let rowHeight = contentHeight + (hasheader ? 50 : 20)



let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"


for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}


let names = ["Anna", "Alex","Brian","Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}


for name in names[2...]{
    print(name)
}

for name in names[...2]{
    print(name)
}


let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)

let allowEntry = false

if !allowEntry {
    print("ACCESS DENIED")
}


let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
}else{
    print("ACCESS DENIED")
}


let hasDoorKey = false
let knowsOverridPassword = true
if hasDoorKey || knowsOverridPassword {
    print("Welcome!")
}else {
    print("ACCESS DENIED")
}

