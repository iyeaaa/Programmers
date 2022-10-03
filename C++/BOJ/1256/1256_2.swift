/**
* 메모리: 79516 KB, 시간: 16 ms
* 2022.10.03
* by Alub
*/
import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var (N, M, K) = (input[0], input[1], input[2])
var memo = [[Int]](repeating: [Int](repeating: 1, count: M+1), count: N+1)
var ans = ""

for i in 1...N {
    for j in 1...M {
        memo[i][j] = min(memo[i-1][j]+memo[i][j-1], 1_000_000_001)
    }
}

var n = N, m = M, k = K
while true {
    if n == 0 {
        ans += String(repeating: "z", count: m)
        break
    }
    if m == 0 {
        ans += String(repeating: "a", count: n)
        break
    }

    let front = memo[n-1][m]

    if front >= k {
        ans += "a"; n -= 1
        continue
    } else {
        ans += "z"; m -= 1; k -= front
        continue
    }
}

print(memo[N][M] < K ? -1 : ans)