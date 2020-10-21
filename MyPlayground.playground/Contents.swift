import UIKit
// Done by Zachary Hong (S10185319)

//Exercise 1
//
for i in 1...20{
    print(i)
}

//Exercise 2
//
for i in 1...20{
    if !(i%2==0) {
        print(i)
    }
}

//Exercise 3
//
var sum = 0
for i in 1...20{
    if !(i%2==0) {
        sum += i
    }
}
print(sum)

// Example 2

// Declare instance function
func sayIt(aNumber: Int) {
    print("You pass a " + String(aNumber))
}

sayIt(aNumber: 5)


//Exercise 4
func result(mark: Int) -> String {
    if mark < 50 {
        return "Fail"
    }
    return "Pass"
}

//print(result(mark: 50))


//Exercise 5
import Foundation

func generateArray(length: Int) -> [Int] {
    var array = [Int]();
    for _ in 1...length{
        array.append(Int(arc4random_uniform(100)))
    }
    return array
}

func findMax(n: [Int]) -> Int {
    var max = 0
    for i in 0..<n.count{
        if n[i] > max{
            max = n[i]
        }
    }
    return max;
}

var a1 = generateArray(length: 10)

//Exercise 6
func findMin(n: [Int]) -> Int {
    var min = Int(INT_MAX)
    for i in 0..<n.count{
        if n[i] < min{
            min = n[i]
        }
    }
    return min;
}


//Exercise 7
func findAverage(n: [Int]) -> Int {
    let sum = n.reduce(0, +)
    return sum/n.count
}

//findMin(n: a1)
//findAverage(n: a1)
