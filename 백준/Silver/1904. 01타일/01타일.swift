let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1000001)
(dp[1], dp[2]) = (1, 2)

for i in stride(from: 3, through: n, by: 1) {
    dp[i] = (dp[i-1] + dp[i-2])%15746
}

print(dp[n])