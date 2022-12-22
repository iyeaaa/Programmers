
let N = Int(readLine()!)!
var parent = [[Int]](repeating: [], count: N+1)
var t = [Int](repeating: 0, count: N+1)
var dp = [Int](repeating: -1, count: N+1)

for i in 1...N {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    t[i] = ip[0]
    if ip[1] == 0 { dp[i] = t[i]; continue }
    parent[i] = ip[2...].map{Int($0)}
}

for i in 1...N {
    for p in parent[i] {
        dp[i] = max(dp[i], dp[p]+t[i])
    }
}

print(dp.max()!)