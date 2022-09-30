/**
* 메모리: 69240 KB, 시간: 8 ms
* 2022.09.30
* by Alub
*/
let N = Int(readLine()!)!
var H = [[0]]
var ans = Int.max

for _ in 0..<N {
    H.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 0..<3 {
    for j in 0..<3 where i != j {
        var memo = [[Int]](repeating: [Int](repeating: 999999999, count: 3), count: N+1)
        memo[1] = H[1]

        for k in 0..<3 where i != k {
            memo[2][k] = memo[1][i] + H[2][k]
        }

        for a in 3..<N {
            for b in 0..<3 {
                for c in 0..<3 where b != c {
                    memo[a][b] = min(memo[a][b], memo[a-1][c]+H[a][b])
                }
            }
        }

        var compared = Int.max
        for k in 0..<3 where j != k {
            compared = min(compared, memo[N-1][k]+H[N][j])
        }

        ans = min(ans, compared)
    }
}

print(ans)


