/**
* 메모리: 100460 KB, 시간: 144 ms
* 2022.10.05
* by Alub
*/
let INF = -987765432
let N = Int(readLine()!)!
let A = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
let B = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = [[Int]](repeating: [Int](repeating: INF, count: N+1), count: N+1)
var ans = 0

memo[1][1] = 0
for i in 1...N {
    for j in 1...N {
        memo[i][j] = max(memo[i][j], memo[i-1][j-1],
                memo[i-1][j], A[i] > B[j-1] ? memo[i][j-1]+B[j-1] : INF)
    }
}

for i in 1...N {
    ans = max(ans, memo[N][i], memo[i][N] + (A[i] > B[N] ? B[N] : INF))
}

print(ans < 0 ? 0 : ans)