/**
* 메모리: 194432 KB, 시간: 564 ms
* 2022.09.30
* by Alub
*/
let A = Array(readLine()!), N = A.count
let B = Array(readLine()!), M = B.count
var memo = [[Int]](repeating: [Int](repeating: 0, count: M+1), count: N+1)
var ans = 0

for i in 1...N {
    for j in 1...M {
        memo[i][j] = A[i-1] == B[j-1] ? memo[i-1][j-1]+1 : 0
        ans = max(ans, memo[i][j])
    }
}

print(ans)