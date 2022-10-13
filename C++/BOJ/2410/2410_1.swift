/**
* 메모리: 76916 KB, 시간: 400 ms
* 2022.10.13
* by Alub
*/
let MOD = 1_000_000_000
let N = Int(readLine()!)!
var memo = [Int](repeating: 0, count: N+1)
memo[0] = 1
var L = [Int]()
var cnt = 1

while cnt <= N {
    L.append(cnt)
    cnt *= 2
}

for v in L {
    for i in v...N {
        memo[i] = (memo[i] + memo[i-v]) % MOD
    }
}

print(memo[N])