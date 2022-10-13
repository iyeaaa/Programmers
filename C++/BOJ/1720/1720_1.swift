/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.10.13
* by Alub
*/
// ans = 대칭 + 대칭x
// memo[n] = 대칭*2 + 대칭x
// ans => memo[n] + 대칭x

let N = Int(readLine()!)!
var memo = [Int](repeating: 1, count: N+1)

for i in stride(from: 2, through: N, by: 1) {
    memo[i] = memo[i-1] + memo[i-2]*2
}

if N % 2 == 0 {
    print((memo[N] + memo[N/2+1]) / 2)
} else {
    print((memo[N] + memo[N/2]) / 2)
}