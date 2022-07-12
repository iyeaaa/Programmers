let N = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)
dp[1] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]

for i in stride(from: 2, through: N, by: 1) {
    dp[i][0] = dp[i-1][1] % 1_000_000_000
    dp[i][9] = dp[i-1][8] % 1_000_000_000
    for j in 1...8 {
        dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1_000_000_000
    }
}

print(dp[N].reduce(0, +) % 1_000_000_000)