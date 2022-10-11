/**
* 메모리: 84724 KB, 시간: 64 ms
* 2022.10.11
* by Alub
*/
// f(n) = f(n-1)*2 + f(n-2)*3 + f(n-3)*2 + f(n-4)*2 + ... + f(0)*2

let MOD = 1_000_000_007
let N = Int(readLine()!)!
var S = [Int](repeating: 0, count: N+1)
var memo = [Int](repeating: 0, count: N+1)

memo[0] = 1; memo[1] = 2
S[0] = 2; S[1] = 6

for i in stride(from: 2, through: N, by: 1) {
    memo[i] = (S[i-1] + memo[i-2]) % MOD
    S[i] = (S[i-1] + memo[i]*2) % MOD
}

print(memo[N])