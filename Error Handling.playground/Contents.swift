enum VendingMachineError: Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


// 抛出错误
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)


// 通过该方式表示方法中抛出的错误都会被传递到掉用该方法的位置
func canThrowErrors() throws -> String { return "" }

// 如果没有定义 throws 关键字，那么方法中抛出的错误只能在方法中单独处理
func cannotThrowErrors() -> String { return "" }

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]

    // 存入的金额
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        // guard 表示表达式为 false/nil 时执行 {} 中的内容
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError
                .insufficientFunds(coinsNeeded: item.price-coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

//try buyFavoriteSnack(person: "Alice", vendingMachine: VendingMachine())



// catch 并不需要列出所有的可能抛出的错误，我们也可以通过最后一个 catch {} 进行捕获即可
// 同时当内部异常已经被 catch 捕获时，即便外面依旧可以进行捕获该类型异常，也不会去执行
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
}catch VendingMachineError.invalidSelection{
    print("invalid Selection")
}catch VendingMachineError.outOfStock{
    print("Out of Stock.")
}catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print(
        "Insufficient funds. Please insert an additional \(coinsNeeded) coins."
    )
}catch{
    print("Unexpected error: \(error).")
}

// catch 可以捕获多个
func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}


//----------------------------------------将异常转为可选值----------------------------------------


func someThrowingFunction() throws -> Int {
    return 1
}

// 该函数可能抛出异常，需要用 try 进行捕获（可能发生，如果发生那么返回值将为 nil,因此用可选 try 更合适）
// 如果真的抛出一个异常，那么 x = nil
// x 为可选值
let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
}catch{
    y = nil
}


// try! 表示禁止错误传播



// 如果我们要指定特定类型的错误才能被传播，写法为  -> throws(StatisticsError)
enum StatisticsError: Error {
    case noRatings
    case invalidRating(Int)
}
// 此函数只能抛出 StatisticsError 错误，如果抛出其他类型的错误，将会导致编译报错
func summarize(_ ratings: [Int]) throws(StatisticsError) {
    guard !ratings.isEmpty else { throw .noRatings }


    var counts = [1: 0, 2: 0, 3: 0]
    for rating in ratings {
        guard rating > 0 && rating <= 3 else { throw .invalidRating(rating) }
        counts[rating]! += 1
    }


    print("*", counts[1]!, "-- **", counts[2]!, "-- ***", counts[3]!)
}

// 这种是指定抛出错误的类型
//let ratings = []
//do throws(StatisticsError) {
//    try summarize(ratings)
//} catch {
//    switch error {
//    case .noRatings:
//        print("No ratings available")
//    case .invalidRating(let rating):
//        print("Invalid rating: \(rating)")
//    }
//}
// Prints "No ratings available"

/*
 这种属于错误推断，因为只抛出了一种异常（简写）
let ratings = []
do {
    try summarize(ratings)
} catch {
    switch error {
    case .noRatings:
        print("No ratings available")
    case .invalidRating(let rating):
        print("Invalid rating: \(rating)")
    }
}
// Prints "No ratings available"
*/

// defer 类似 final
// 如果有多个 defer 则反着执行，第一个 defer 最后执行，依次类推
//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            // Work with the file.
//        }
//        // close(file) is called here, at the end of the scope.
//    }
//}


