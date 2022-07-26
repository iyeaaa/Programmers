let N = Int(readLine()!)!
let list = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)

for i in 1...N {
    for j in 1...N {
        dp[i][j] = list[i] == list[N-j+1] ? dp[i-1][j-1] + 1 : max(dp[i-1][j], dp[i][j-1])
    }
}

print(N - dp[N][N])