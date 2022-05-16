let n = Int(readLine()!)!
var c = [Consulting(t: 0, p: 0)]
var dp = [Int](repeating: 0, count: n+1)

for _ in 0..<n {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    c.append(Consulting(t: input[0], p: input[1]))
}

dp[n] = (c[n].t == 1 ? c[n].p : 0)

for i in stride(from: n-1, through: 1, by: -1) {
    if c[i].t + i <= n+1 {
        if c[i].t + i == n+1 {
            dp[i] = max(c[i].p, dp[i+1])
        } else {
            dp[i] = max(dp[c[i].t + i]+c[i].p, dp[i+1])
        }
    } else {
        dp[i] = dp[i+1]
    }
}

print(dp.max()!)

struct Consulting {
    let t: Int
    let p: Int
}