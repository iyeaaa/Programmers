/**
* 메모리: 69236 KB, 시간: 12 ms
* 2022.10.12
* by Alub
*/
// f(n, m, k): 한 학기가 n일일떄, 지각을 m번하고 마지막에 결석을 k번 연속으로 한 개근상을 받을 수 있는 학생의 수
// f(n, 0, 0) = f(n-1, 0, k~0)
// f(n, m, 0) = f(n-1, m, k~0) + f(n-1, m-1, k~0)
// f(n, m, k) = f(n-1, m, k-1)

let MOD = 1_000_000
let N = Int(readLine()!)!
var memo = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: 3), count: N+1)
var ans = 0

memo[1][0][0] = 1; memo[1][0][1] = 1; memo[1][1][0] = 1

for i in stride(from: 2, through: N, by: 1) {
    for j in 0...1 {
        for k in 0...2 {
            if j == 0 && k == 0 {
                memo[i][j][k] = memo[i-1][j].reduce(0, +) % MOD
            } else if k == 0 {
                memo[i][j][k] = memo[i-1][j].reduce(0, +) % MOD + memo[i-1][j-1].reduce(0, +) % MOD
            } else {
                memo[i][j][k] = memo[i-1][j][k-1]
            }
        }
    }
}

for i in 0...1 {
    for j in 0...2 {
        ans = (ans + memo[N][i][j]) % MOD
    }
}

print(ans)