let N = Int(readLine()!)!

var count = 0
for _ in 0..<N {
    var stack = [Character]()
    let strn = Array(readLine()!)
    var success = true

    for c in strn {
        if strn.count % 2 == 1 { success = false; break }
        if stack.isEmpty { stack.append(c); continue }
        if stack.last! == c { stack.removeLast(); continue }
        stack.append(c)
    }

    if stack.isEmpty && success {
        count += 1
    }
}
print(count)