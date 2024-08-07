let someString = "Some string literal value"

var quotation = """
    The White Rabbit put on his spectacles.  "Where shall I begin,
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on
    till you come to the end; then stop."
"""


let wiseWords = "\"Imagination is more important than konwledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingheart = "\u{1F496}"

// 在 """ 可以直接使用 " 表示双引号，但是如果要表示 """ 则至少在前面加一个转义字符
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}
// 打印输出：“Nothing to see here”

var variableString = "Horse"
variableString += " and carriage"

// 不可修改
//let constantString = "Highlander"
//constantString += " and another Highlander"

for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"


// 字符数组转为字符串
let catCharacters: [Character] = ["c","a","t","!","🐯"]
let catString = String(catCharacters)

print(catString)

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
print(welcome)


var instruction = "look over"
instruction += string2

let exclamationMark02: Character = "!"
welcome.append(exclamationMark02)

let badStart = """
one
two
"""

let end = """
three
"""

print(badStart+end)


let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)) * 2.5"

print(message)



print(#"Write an interpolated string in Swift using \(multiplier)."#)


print(#"6 times 7 is \#(6 * 7)."#)
// 打印 "6 times 7 is 42"



let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"


let precomposed: Character = "\u{D55C}"

let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

//let regionalIndicatorForUS: Character = "\{E9}\u{20DD}"


var word = "cafe"
print("the number of characters in \(word) is \(word.count)")

word += "\u{30}"




let greeting = "Guten Tag!"
greeting[greeting.startIndex]

greeting[greeting.index(before: greeting.endIndex)]

greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]


//greeting[greeting.endIndex]



var welcome1 = "hello"
// welcome 变量现在等于 "hello!"
welcome1.insert("!", at: welcome1.endIndex)

welcome1
    .insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))


quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}


let eAcuteQuestion = "Voulez-vous un caf \u{E9}"


let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1"){
        act1SceneCount += 1
    }
}


print("There are \(act1SceneCount) scenes in Act 1")







let dogString = "Dog!!🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit)",terminator: "")
}
print("")




for codeUnit in dogString.utf16 {
    print("\(codeUnit)",terminator: "")
}
print("")



for scalar in dogString.unicodeScalars {
    print("\(scalar.value)",terminator: "")
}
print("")


for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}




