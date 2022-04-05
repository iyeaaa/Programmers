var stack = [Int]()
let k = Int(readLine()!)!
var result = 0

for _ in 1...k {
    let temp = Int(readLine()!)!
    if temp == 0 {
        stack.popLast()
    }
    else {
        stack.append(temp)
    }
}

print(stack.reduce(0){$0 + $1})
