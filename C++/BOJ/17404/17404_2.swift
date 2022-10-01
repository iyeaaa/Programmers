/**
* 메모리: 69240 KB, 시간: 12 ms
* 2022.10.01
* by Alub
*/
let N = Int(readLine()!)!
var H = [[0]]
var ans = Int.max

for _ in 0..<N {
    H.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

for i in 0..<3 {
    var memo = [[Int]](repeating: [Int](repeating: 1000001, count: 3), count: N+1)
    memo[1][i] = H[1][i]
    for j in 2..<N {
        for k in 0..<3 {
            for l in 0..<3 where k != l {
                memo[j][k] = min(memo[j][k], memo[j-1][l]+H[j][k])
            }
        }
    }
    for j in 0..<3 where i != j {
        for k in 0..<3 where j != k {
            memo[N][j] = min(memo[N][j], memo[N-1][k]+H[N][j])
        }
    }
    ans = min(ans, memo[N].min()!)
}

print(ans)
