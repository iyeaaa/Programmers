let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 100001)
(dp[1][0], dp[1][1], dp[1][2]) = (1, 2, 3)

for i in stride(from: 2, through: n, by: 1) {
    dp[i][0] = (dp[i-1][1] + dp[i-1][0]) % 9901
    dp[i][1] = (dp[i-1][1] + dp[i-1][0]*2) % 9901
    dp[i][2] = (dp[i][1] + dp[i][0]) % 9901
}

print(dp[n][2])