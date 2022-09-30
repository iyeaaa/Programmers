/**
* 메모리: 77672 KB, 시간: 36 ms
* 2022.09.30
* by Alub
*/
var ans = ""
var memo = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 100_001)
memo[1][1] = 1
memo[2][2] = 1
memo[3][1] = 1; memo[3][2] = 1; memo[3][3] = 1

for i in 4...100000 {
    for (a, b, c) in [(1, 2, 3), (2, 1, 3), (3, 1, 2)] {
        memo[i][a] = (memo[i-a][b] + memo[i-a][c]) % 1_000_000_009
    }
}

for _ in 0..<Int(readLine()!)! {
    ans += "\(memo[Int(readLine()!)!].reduce(0, +) % 1_000_000_009)\n"
}

print(ans)

