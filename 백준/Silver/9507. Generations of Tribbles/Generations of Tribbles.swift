var Case = Int(readLine()!)!
var result = ""
var dp = [Int](repeating: 0, count: 68)
(dp[0], dp[1], dp[2], dp[3]) = (1, 1, 2, 4)

for i in 4...67 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3] + dp[i-4]
}

for _ in 0..<Case {
    result += "\(dp[Int(readLine()!)!])\n"
}

print(result)