let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 91)
dp[0] = 0
dp[1] = 1

for i in 2...90 {
    dp[i] = dp[i-1] + dp[i-2]
}

print(dp[n])