
let N = Int(readLine()!)!
var H = [0]; for _ in 1...N {H.append(Int(readLine()!)!)}
var stk = [0], ans = 0

H.append(0)
for i in 1...N+1 {
    while !stk.isEmpty && H[stk.last!] > H[i] {
        ans = max(ans, H[stk.popLast()!]*(i-stk.last!-1))
    }
    stk.append(i)
}

print(ans)