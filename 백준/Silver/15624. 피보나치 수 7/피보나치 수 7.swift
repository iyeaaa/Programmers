var dp = [Int](repeating: 0, count: 1_000_001)
(dp[0], dp[1]) = (0, 1)

for i in 2...1000000 {
    dp[i] = (dp[i-1] + dp[i-2]) % 1_000_000_007
}

print(dp[Int(readLine()!)!])