struct FixedLengRange {
    var firstValue: Int;
    let length:Int;
}

var rangOfThreeItems = FixedLengRange(firstValue: 0, length: 3)
rangOfThreeItems.firstValue = 6


let rangeOfFourItems = FixedLengRange(firstValue: 0, length: 4)

//无法修改，因为 rangeOfFourItems 是 let 常量
// 结构体是值类型，如果实例定义为 let 常量，那么该实例的所有属性都将是常量（这一点和引用类型不同  -> 类）
//rangeOfFourItems.firstValue = 6



class DataImporter {

    var fileName = "data.txt"
}


class DataManager {
    // 带有 lazy 字段的属性必须是 var 变量，因为常量在初始化完成前必须具备值
    // 仅在首次使用 importer 时才会被初始化
    // 如果多个线程同时访问 importer 属性，但是它并没有被初始化，那么无法保证该实例只被初始化一次
    lazy var importer = DataImporter()
    var data:[String] = []
}


let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.importer.fileName)

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        // 当进行初始化时，会调用该 get 方法
        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        // 可选
        // 当进行赋值时，会调用 set 方法
        set(newCenter){
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }

    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
initialSquareCenter.x
initialSquareCenter.y
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()

stepCounter.totalSteps = 200

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {return number}
        set {number = min(newValue, 12 )}
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}
var rectangle = SmallRectangle()


rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)


@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    var wrappedValue: Int {
        get { return number}
        set { number = min(newValue, maximum) }
    }

    init(){
        maximum = 12;
        number = 0;
    }
    init(wrappedValue:Int){
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}


class Someclass {
    class func someTypeMethod(){

    }
}

Someclass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    static func unlock(_ level:Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level:Int)->Bool{
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level:Int)->Bool{
        if LevelTracker.isUnlocked(level){
            currentLevel = level;
            return true;
        }else{
            return false;
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level:Int){
        LevelTracker.unlock(level+1)
        tracker.advance(to: level+1)
    }
    init(name:String){
        playerName = name;
    }
}
var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")


player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")

}else {
    print("level 6 hasn't yet been unlocked")

}
