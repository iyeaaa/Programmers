func solve() -> String {
    var count = 0
    for c in Array(readLine()!) {
        if c == "(" { count += 1 }
        else {
            if count == 0 { return "NO"}
            count -= 1
        }
    }
    return count == 0 ? "YES" : "NO"
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    result += "\(solve())\n"
}
print(result)