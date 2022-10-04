/**
* 메모리: 77416 KB, 시간: 52 ms
* 2022.10.04
* by Alub
*/
let A = Array(readLine()!), N = A.count
let B = Array(readLine()!), M = B.count
let C = Array(readLine()!), K = C.count
var memo = Array(repeating: Array(repeating: Array(repeating: 0,
        count: K+1), count: M+1), count: N+1)

for i in 1...N {
    for j in 1...M {
        for k in 1...K {
            if A[i-1] == B[j-1] && B[j-1] == C[k-1] {
                memo[i][j][k] = memo[i-1][j-1][k-1] + 1
            } else {
                memo[i][j][k] = max(memo[i-1][j][k], memo[i][j-1][k], memo[i][j][k-1])
            }
        }
    }
}

print(memo[N][M][K])