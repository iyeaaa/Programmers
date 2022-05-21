let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
var dp = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)

for i in 1...n {
    graph[i] = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}
}

for i in 1...n {
    for j in 1...m {
        dp[i][j] = max(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + graph[i][j]
    }
}

print(dp[n][m])