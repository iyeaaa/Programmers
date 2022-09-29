/**
* 메모리: 76984 KB, 시간: 44 ms
* 2022.09.29
* by Alub
*/
let A = Array(readLine()!), N = A.count
let B = Array(readLine()!), M = B.count
var memo = [[Int]](repeating: [Int](repeating: 0, count: M+1), count: N+1)
var ans = [Character]()

for i in 1...N {
    for j in 1...M {
        memo[i][j] = (A[i-1] == B[j-1] ? memo[i-1][j-1]+1 : max(memo[i-1][j], memo[i][j-1]))
    }
}

var len1 = N, len2 = M
while memo[len1][len2] != 0 {
    if memo[len1][len2] == memo[len1][len2-1] {
        len2 -= 1
    } else if memo[len1][len2] == memo[len1-1][len2] {
        len1 -= 1
    } else if memo[len1][len2] - 1 == memo[len1-1][len2-1] {
        ans.append(A[len1-1])
        len1 -= 1; len2 -= 1
    }
}

print(memo[N][M])
print(ans.reversed().map{String($0)}.joined())
