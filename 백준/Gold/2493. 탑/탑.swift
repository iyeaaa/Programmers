let n = Int(readLine()!)!
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var stack = [0]
var result = "0 "

for i in 1..<n {
    while !stack.isEmpty && list[stack.last!] < list[i] {
        let _ = stack.removeLast()
    }
    if !stack.isEmpty {
        result += "\(stack.last! + 1) "
    } else {
        result += "0 "
    }
    stack.append(i)
}

print(result)