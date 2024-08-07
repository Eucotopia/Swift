// 创建数组
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)

print(someInts)

var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles

print(sixDoubles)

var shoppingList: [String] = ["Eggs","Milk"]

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
}else{
    print("The shopping list is not empty.")
}

shoppingList.append("Water")
print(shoppingList)

shoppingList += ["Baking Powder","Cheese"]

var firstItem = shoppingList[0]
firstItem = shoppingList.first!
shoppingList[0] = "Six eggs"

// 也可以将三项替换为两项
shoppingList[1...3] = ["Bananas","Apples"]

shoppingList.remove(at: 0)


shoppingList.removeLast()

for item in shoppingList {
    print(item)
}


// enumerated 返回有索引值和数组组成的元组
for (index,item) in shoppingList.enumerated() {

}


var letters = Set<Character>()


print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []


var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]

print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if favoriteGenres.contains("Funk"){
    print("I get up on the good foot.")
}else{
    print("It's too funky in here.")
}

for genre in favoriteGenres {
    print("\(genre)")
}

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]
// 合并
let newSet:[Int] = oddDigits.union(evenDigits).sorted()
print(newSet)
print(oddDigits)

// 创建交集
oddDigits.intersection(evenDigits).sorted()

// 不相交的值创建一个集合
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

// 根据不在另一个集合中的值创建一个新的集合
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]


houseAnimals.isSubset(of: farmAnimals)// 是否为子集
// true
farmAnimals.isSuperset(of: houseAnimals)// 是否为父集
// true
farmAnimals.isDisjoint(with: cityAnimals)// 是否没有交集
// true


var namesOfIntergers: [Int:String] = [:]
namesOfIntergers[16] = "sixteen"
namesOfIntergers = [:]

var airports: [String:String] = ["YYZ":"Tornoto Pearon","DUB":"Dubin"]


print("The dictionary of airports contains \(airports.count) items.")

airports["LHR"] = "London"
print(airports)
airports["LHR"] = "London Heathrow"


for(airportCode,airportName) in airports {
    print("\(airportCode):\(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Toronto Pearson
// Airport name: London Heathrow


let airportCodes = [String](airports.keys)
let airportnames = [String](airports.values)
