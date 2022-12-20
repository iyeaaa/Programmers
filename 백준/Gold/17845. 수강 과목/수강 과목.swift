
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (ip[0], ip[1])
var dp = [Int](repeating: Int.min, count: 10001); dp[0] = 0

for _ in 0..<k {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (i, t) = (ip[0], ip[1])
    for time in stride(from: n, through: t, by: -1) {
        dp[time] = max(dp[time], dp[time-t] + i)
    }
}

print(dp.max()!)