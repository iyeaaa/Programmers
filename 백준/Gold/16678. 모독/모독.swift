
let N = Int(readLine()!)!
var a = [Int](); for _ in 0..<N { a.append(Int(readLine()!)!) }
var cur = 1, ans = 0

for v in a.sorted() where v >= cur {
    ans += v - cur
    cur += 1
}

print(ans)