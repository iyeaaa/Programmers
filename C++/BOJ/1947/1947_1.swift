/**
* 메모리: 76916 KB, 시간: 36 ms
* 2022.10.15
* by Alub
*/
let MOD = 1_000_000_000
let N = Int(readLine()!)!
var memo = [Int](repeating: 0, count: 1000005)

memo[2] = 1

for i in stride(from: 3, through: N, by: 1) {
    memo[i] = (i-1)*memo[i-1] % MOD + (i-1)*memo[i-2] % MOD
}

print(memo[N] % MOD)