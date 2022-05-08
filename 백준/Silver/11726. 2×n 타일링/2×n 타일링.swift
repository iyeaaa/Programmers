let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)
if n == 1 {
    print(1)
} else {
    (dp[1], dp[2]) = (1, 2)

    for i in stride(from: 3, through: n, by: 1) {
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }

    print(dp[n])
}
