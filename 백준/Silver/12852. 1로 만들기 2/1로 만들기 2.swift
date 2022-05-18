let n = Int(readLine()!)!
var dp = [[Int]](repeating: [0, 1], count: n+1)

for i in stride(from: 2, through: n, by: 1) {
    dp[i][0] = dp[i-1][0] + 1
    dp[i][1] = i-1
    if i % 2 == 0 {
        dp[i][0] = min(dp[i][0], dp[i/2][0] + 1)
        if dp[i][0] == dp[i/2][0] + 1 {
            dp[i][1] = i/2
        }
    }
    if i % 3 == 0 {
        dp[i][0] = min(dp[i][0], dp[i/3][0] + 1)
        if dp[i][0] == dp[i/3][0] + 1 {
            dp[i][1] = i/3
        }
    }
}

print(dp[n][0])
if n == 1{
    print(1)
} else {
    var i = dp[n][1]
    var result = "\(n) \(i) "
    while i != 1 {
        i = dp[i][1]
        result += "\(i) "
    }

    print(result)
}

