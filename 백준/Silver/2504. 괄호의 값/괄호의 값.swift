var save = 1
var result = 0
var stack = [Character]()
let input = Array(readLine()!)

for i in 0..<input.count {
    if input[i] == "(" {
        stack.append("(")
        save *= 2
    } else if input[i] == "[" {
        stack.append("[")
        save *= 3
    } else if input[i] == ")" {
        if stack.isEmpty || stack.last! != "(" {
            result = 0
            break
        }
        if input[i-1] == "(" {
            result += save
        }
        save /= 2
        let _ = stack.popLast()!
    } else {
        if stack.isEmpty || stack.last! != "[" {
            result = 0
            break
        }
        if input[i-1] == "[" {
            result += save
        }
        save /= 3
        let _ = stack.popLast()!
    }
}

print(stack.isEmpty ? result : 0)

