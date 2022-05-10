let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)

for i in 0...n {
    for j in 0...min(i, k) {
        if j == 0 || j == i {
            dp[i][j] = 1
        } else {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j]) % 10007
        }
    }
}

print(dp[n][k])


