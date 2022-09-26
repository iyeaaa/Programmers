/**
* 메모리: 69236 KB, 시간: 12 ms
* 2022.09.26
* by Alub
*/
let N = Int(readLine()!)!
var L = [[Int]]()
var dp = [[Int]](repeating: [Int](repeating: Int.max, count: 3), count: N)

for _ in 0..<N {
    L.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
dp[0] = L[0]

for i in 1..<N {
    for j in 0..<3 {
        for k in 0..<3 where j != k {
            dp[i][j] = min(dp[i-1][k]+L[i][j], dp[i][j])
        }
    }
}

print(dp.last!.min()!)