import Foundation

var result = ""

first: while true {
    let str = readLine()!
    var stack = [String]()

    if str == "." {
        break
    }

    for ch in str {
        if String(ch) == "(" || String(ch) == "[" {
            stack.append(String(ch))
        }
        else if String(ch) == ")" {
            if stack.isEmpty {
                result += "no\n"
                continue first
            }
            let temp = stack.popLast()
            if temp != "(" {
                result += "no\n"
                continue first
            }
        }
        else if String(ch) == "]" {
            if stack.isEmpty {
                result += "no\n"
                continue first
            }
            let temp = stack.popLast()
            if temp != "[" {
                result += "no\n"
                continue first
            }
        }
    }

    if stack.isEmpty {
        result += "yes\n"
    }
    else {
        result += "no\n"
    }
}

print(result)