var dp = [[Int]](repeating: [Int](repeating: 1, count: 10), count: 101)
dp[1][0] = 0

for i in 2...100 {
    for j in 0...9 {
        if j == 0 {
            dp[i][j] = dp[i-1][1] % 1_000_000_000
        } else if j == 9 {
            dp[i][j] = dp[i-1][8] % 1_000_000_000
        } else {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1_000_000_000
        }
    }
}

var sum = 0
let n = Int(readLine()!)!
for i in 0...9 {
    sum = (sum + dp[n][i]) % 1_000_000_000
}

print(sum)

/*
 1, 2, 3, 4, 5, 6, 7, 8, 9
 10, 12, 21, 23, 32, 34, ..., 89, 98, x
 101, 121, 123, 210, 212, 232, 234, 321, ..., 987, 989
 */