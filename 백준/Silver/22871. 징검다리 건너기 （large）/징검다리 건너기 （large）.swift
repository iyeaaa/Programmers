let n = Int(readLine()!)!
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: 0, count: A.count); dp[1] = 1 + abs(A[1]-A[0])

for i in stride(from: 2, to: n, by: 1) {
    dp[i] = max(dp[i-1], 1+abs(A[i]-A[i-1]))
    for j in stride(from: i-2, through: 0, by: -1) {
        dp[i] = min(dp[i], max((i-j)*(1+abs(A[i]-A[j])), dp[j]))
    }
}

print(dp[n-1])