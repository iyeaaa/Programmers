let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
let INF = 1000000001
var coins = [Int](); for _ in 0..<n { coins.append(Int(readLine()!)!) }
var dp = [Int](repeating: INF, count: 10001); dp[0] = 0

for coin in coins {
    for i in stride(from: coin, through: k, by: 1) {
        dp[i] = min(dp[i-coin]+1, dp[i])
    }
}

print(dp[k] == INF ? -1 : dp[k])