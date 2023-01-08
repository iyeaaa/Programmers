
let INF = 999999999
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (ip[0], ip[1])
var not = [Bool](repeating: false, count: N+1)
var dp = [[Int]](repeating: [Int](repeating: INF, count: N+1), count: N+1)
let info = [(1, 0, 10000), (3, 1, 25000), (5, 2, 37000), (1, -3, 0)]

dp[0][0] = 0
if M > 0 {
    for v in readLine()!.split{$0==" "}.map{Int(String($0))!} {
        not[v] = true
    }
}

for i in 1...N {
    if not[i] { dp[i] = dp[i-1] }
    for j in 0...N {
        for (day, coupon, cost) in info where i-day>=0 && (0...N) ~= j-coupon {
            dp[i][j] = min(dp[i][j], dp[i-day][j-coupon] + cost)
        }
    }
}

print(dp[N].min()!)