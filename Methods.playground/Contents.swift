class Counter {
    var count = 0
    func increment(){
        self.count += 1
    }
    func increment(by amount: Int){
        count += amount
    }
    func reset(){
        count = 0
    }
}
let counter = Counter()

counter.increment()

print(counter.count)
counter.increment(by: 5)
print(counter.count)
counter.reset()
print(counter.count)

struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOf(x:Double)->Bool{
        return self.x > x
    }

    mutating func moveBy(x deltaX:Double,y deltaY:Double){
        x += deltaX
        y += deltaY
    }

}

let point =  Point(x: 4.0, y: 5.0)

if point.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}


var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

// 通过 class 和 struct 可知，虽然二者都可以定义方法，但是在 struct 和 enum 都是值类型，因此无法修改成员属性，除非定义方法为 mutating
