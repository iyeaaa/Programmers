let N = Int(readLine()!)!
var dp = [Int](repeating: Int.max, count: N+1); dp[1] = 0

for i in stride(from: 2, through: N, by: 1) {
    dp[i] = dp[i-1] + 1
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i/2]+1)
    }
    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i/3]+1)
    }
}

print(dp[N])