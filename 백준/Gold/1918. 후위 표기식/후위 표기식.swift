import Foundation

func solution() {
    var stack = [Character]()
    var result = ""
    for s in readLine()! {
        if s == "+" || s == "-" {
            while !stack.isEmpty && stack.last! != "(" {
                result.append(stack.popLast()!)
            }
            stack.append(s)
        } else if s == "*" || s == "/" {
            while !stack.isEmpty && (stack.last! == "*" || stack.last! == "/") {
                result.append(stack.popLast()!)
            }
            stack.append(s)
        } else if s == "(" {
            stack.append("(")
        } else if s == ")" {
            while !stack.isEmpty && stack.last! != "(" {
                result.append(stack.popLast()!)
            }
            stack.removeLast()
        } else {
            result.append(s)
        }
    }
    while !stack.isEmpty {
        result.append(stack.popLast()!)
    }
    print(result)
}

solution()