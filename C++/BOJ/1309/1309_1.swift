/**
* 메모리: 76088 KB, 시간: 32 ms
* 2022.09.27
* by Alub
*/
let N = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 1, count: 3), count: N+1)

for i in stride(from: 2, through: N, by: 1) {
    dp[i][0] = dp[i-1].reduce(0, +) % 9901
    dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % 9901
    dp[i][2] = (dp[i-1][0] + dp[i-1][1]) % 9901
}

print(dp[N].reduce(0, +) % 9901)