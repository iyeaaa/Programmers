let n = Int(readLine()!)!
var hscolor = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)

for i in 0..<n {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    (hscolor[i][0], hscolor[i][1], hscolor[i][2]) = (input[0], input[1], input[2])
}

(dp[0][0], dp[0][1], dp[0][2]) = (hscolor[0][0], hscolor[0][1], hscolor[0][2])

for i in 1..<n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + hscolor[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + hscolor[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + hscolor[i][2]
}

print(min(dp[n-1][0], dp[n-1][1], dp[n-1][2]))