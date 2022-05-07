var Case = Int(readLine()!)!

while Case > 0 {
    let n = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: 101)
    (dp[1], dp[2], dp[3], dp[4], dp[5], dp[6], dp[7], dp[8]) = (1, 1, 1, 2, 2, 3, 4, 5)
    for i in stride(from: 9, through: n, by: 1) {
        dp[i] = dp[i-1] + dp[i-5]
    }
    print(dp[n])
    Case -= 1
}