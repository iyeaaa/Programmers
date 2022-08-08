let N = Int(readLine()!)!
var count = 0
for _ in 0..<N {
    var stack = [Character]()
    let strn = Array(readLine()!)
    for c in strn {
        if stack.isEmpty { stack.append(c); continue }
        if stack.last! == c { stack.removeLast(); continue }
        stack.append(c)
    }
    count += stack.isEmpty ? 1 : 0
}
print(count)