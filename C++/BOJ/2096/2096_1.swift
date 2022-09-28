/**
* 메모리: 90188 KB, 시간: 172 ms
* 2022.09.28
* by Alub
*/
let N = Int(readLine()!)!
var L = [[Int]]()
var min_dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
var max_dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)

for _ in 0..<N {
    L.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 0..<3 { min_dp[0][i] = L[0][i]; max_dp[0][i] = L[0][i]; }

for i in 1..<N {
    min_dp[i][0] = min(min_dp[i-1][0], min_dp[i-1][1]) + L[i][0]
    min_dp[i][1] = min(min_dp[i-1][0], min_dp[i-1][1], min_dp[i-1][2]) + L[i][1]
    min_dp[i][2] = min(min_dp[i-1][1], min_dp[i-1][2]) + L[i][2]
    max_dp[i][0] = max(max_dp[i-1][0], max_dp[i-1][1]) + L[i][0]
    max_dp[i][1] = max(max_dp[i-1][0], max_dp[i-1][1], max_dp[i-1][2]) + L[i][1]
    max_dp[i][2] = max(max_dp[i-1][1], max_dp[i-1][2]) + L[i][2]
}

print(max_dp[N-1].max()!, min_dp[N-1].min()!)