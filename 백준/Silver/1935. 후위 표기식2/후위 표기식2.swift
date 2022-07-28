import Foundation

extension Character {
    var index: Int {
        Int(unicodeScalars.first!.value)-65
    }
}

let N = Int(readLine()!)!
let strn = Array(readLine()!)
var list = [Double](); for _ in 0..<N { list.append(Double(readLine()!)!) }

var stack = [Double]()
for c in strn {
    switch c {
    case "+":
        stack.append(stack.popLast()!+stack.popLast()!)
    case "-":
        let (x, y) = (stack.popLast()!, stack.popLast()!)
        stack.append(y-x)
    case "*":
        stack.append(stack.popLast()!*stack.popLast()!)
    case "/":
        let (x, y) = (stack.popLast()!, stack.popLast()!)
        stack.append(y/x)
    default:
        stack.append(list[c.index])
    }
}

print(String(format: "%.2f", stack.popLast()!))
