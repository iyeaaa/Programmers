/**
* 메모리: 87472 KB, 시간: 68 ms
* 2022.10.02
* by Alub
*/
import Foundation

let MOD = 1_000_000_000
let N = Int(readLine()!)!
var memo = Array(repeating: Array(repeating: [Int](repeating: 0,
        count: 1<<10), count: 10), count: N+1)
var ans = 0

for i in 1...9 {
    memo[1][i][1<<i] = 1
}

for i in stride(from: 2, through: N, by: 1) {
    for j in 0...9 {
        for pre in [j-1, j+1] where (0...9) ~= pre {
            for bit in 0..<1<<10 {
                memo[i][j][bit|1<<j] = (memo[i][j][bit|1<<j] + memo[i-1][pre][bit]) % MOD
            }
        }
    }
}

for i in 0...9 {
    ans = (ans + memo[N][i][1<<10-1]) % MOD
}

print(ans)