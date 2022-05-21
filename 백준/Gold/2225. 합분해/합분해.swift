let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var dp = [[Int]](repeating: [Int](repeating: 0, count: 201), count: 201)

for i in stride(from: 0, through: k, by: 1) {
    dp[i][0] = 1
}

for i in stride(from: 1, through: k, by: 1) {
    for j in stride(from: 1, through: n, by: 1) {
        dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % 1_000_000_000
    }
}

print(dp[k][n])