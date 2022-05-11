let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1001)
(dp[1], dp[2]) = (1, 3)

for i in stride(from: 3, through: 1000, by: 1) {
    dp[i] = (dp[i-2]*2 + dp[i-1])%10007
}

print(dp[n])