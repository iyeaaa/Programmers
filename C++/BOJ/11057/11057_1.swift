/**
* 메모리: 69232 KB, 시간: 8 ms
* 2022.09.27
* by Alub
*/
let N = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 1, count: 10), count: N+1)

for i in stride(from: 2, through: N, by: 1){
    for j in 0...9 {
        dp[i][j] = dp[i-1][...j].reduce(0, +) % 10_007
    }
}

print(dp[N].reduce(0, +) % 10_007)

