var dp = [[Int]](repeating: [Int](repeating: 1, count: 31), count: 31)

for i in 1...30 {
    for j in 1...i {
        if j == 1 || j == i {
            dp[i][j] = 1
        } else {
            dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
        }
    }
}

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])

print(dp[n][k])