func solve() -> String {
    var count = 0
    for c in Array(readLine()!) {
        count += (c == "(" ? 1 : -1)
        if count < 0 { return "NO" }
    }
    return count == 0 ? "YES" : "NO"
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    result += "\(solve())\n"
}
print(result)