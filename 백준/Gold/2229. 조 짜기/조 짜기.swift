
let N = Int(readLine()!)!
let a = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: 0, count: N+1)

for i in 1...N {
    var mx = a[i], mn = a[i]
    for j in stride(from: i-1, through: 0, by: -1) {
        dp[i] = max(dp[i], dp[j] + mx - mn)
        mx = max(mx, a[j]); mn = min(mn, a[j])
    }
}

print(dp.last!)