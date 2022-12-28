
let n = Int(readLine()!)!
var l = [Int](); for _ in 0..<n { l.append(Int(readLine()!)!) }
var v = [Bool](repeating: false, count: n)
var ans = 0

l.sort()

for i in stride(from:0,to:n-1,by:2) {
    if l[i+1] > 0 { break }
    ans += l[i] * l[i+1]
    v[i] = true; v[i+1] = true
}

for i in stride(from:n-1,to:0,by:-2) {
    if l[i-1] <= 1 { break }
    ans += l[i] * l[i-1]
    v[i] = true; v[i-1] = true
}

for i in 0..<n where !v[i] { ans += l[i] }

print(ans)