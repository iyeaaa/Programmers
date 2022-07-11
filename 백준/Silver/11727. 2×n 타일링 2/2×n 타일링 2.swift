var dp = [Int](repeating: 1, count: 1001); dp[2] = 3
for i in 3...1000 {
    dp[i] = (dp[i-1] + dp[i-2]*2) % 10007
}
print(dp[Int(readLine()!)!])