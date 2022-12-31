
let N = Int(readLine()!)!
var mx = Int(readLine()!)!, prev = mx, ans = 0

for _ in 1..<N {
    let cur = Int(readLine()!)!
    mx = max(mx, cur)
    if prev < cur {
        ans += cur - prev
    }
    prev = cur
}

print(ans + mx - prev)