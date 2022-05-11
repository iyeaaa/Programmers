let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 81)
(dp[1], dp[2]) = (1, 1)

for i in 3...80 {
    dp[i] = dp[i-1] + dp[i-2]
}

print(dp[n]*4 + dp[n-1]*2)

