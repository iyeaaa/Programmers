var dp = [Int](repeating: 0, count: 31)
dp[2] = 3

for i in stride(from: 4, through: 30, by: 2) {
    dp[i] = dp[i-2]*3 + 2
    for j in stride(from: 2, through: i-4, by: 2) {
        dp[i] += dp[j]*2
    }
}

print(dp[Int(readLine()!)!])