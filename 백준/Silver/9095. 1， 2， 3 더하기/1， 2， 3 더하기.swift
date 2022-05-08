let Case = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 11)
(dp[1], dp[2], dp[3]) = (1, 2, 4)

for i in 4...10 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

for c in 0..<Case {
    print(dp[Int(readLine()!)!])
}