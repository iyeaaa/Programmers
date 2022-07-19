let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var dp = [[Int]](repeating: [Int](repeating: 0, count: K+1), count: N+1)

for i in 0...K {
    dp[0][i] = 1
}

for i in 1...K {
    for j in 1...N {
        dp[j][i] = (dp[j-1][i] + dp[j][i-1]) % 1_000_000_000
    }
}

print(dp[N][K])