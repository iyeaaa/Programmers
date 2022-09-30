/**
* 메모리: 79928 KB, 시간: 16 ms
* 2022.09.30
* by Alub
*/
import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, S, M) = (input[0], input[1], input[2])
let V = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = [[Bool]](repeating: [Bool](repeating: false, count: 10001), count: N+1)
dp[0][S] = true

for i in 1...N {
    for j in 0...M {
        for cur in [j+V[i], j-V[i]] where (0...M) ~= cur && dp[i-1][j] {
            dp[i][cur] = dp[i-1][j]
        }
    }
}

for i in stride(from: M, through: 0, by: -1) {
    if dp[N][i] {
        print(i)
        exit(0)
    }
}

print(-1)