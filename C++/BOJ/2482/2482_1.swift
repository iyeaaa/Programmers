/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.10.10
* by Alub
*/
func C(_ n: Int, _ k: Int) -> Int {
    var d = [Int](repeating: 0, count: 1005); d[0] = 1
    for i in 0...n {
        for j in stride(from: min(i, k), through: 1, by: -1) {
            d[j] = (d[j-1] + d[j]) % MOD
        }
    }
    return d[k]
}

let MOD = 1_000_000_003
let (N, K) = (Int(readLine()!)!, Int(readLine()!)!)
print(K == 1 ? N : (MOD+C(N-K+1, K)-C(N-K-1, K-2)) % MOD)