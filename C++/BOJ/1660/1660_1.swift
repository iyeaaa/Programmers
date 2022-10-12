/**
* 메모리: 73788 KB, 시간: 564 ms
* 2022.10.12
* by Alub
*/
// b(n): n번째 삼각형을 만드는데 필요한 대포알의 개수
// b(n) = b(n-1) + n
// t(n): n번째 사면체를 만드는데 필요한 대포알의 개수
// t(n) = t(n-1) + b(n-1) + n
// t(n) = t(n-1) + b(n)
// f(n): n개의 대포알로 만들 수 있는 사면체의 최소 개수
// f(n) = min(f(n-k1), f(n-k2), f(n-k3), ...) + 1

let INF = 987654321
let N = Int(readLine()!)!
var b = [Int](repeating: 1, count: N+1)
var t = [1, 1]
var memo = [Int](repeating: INF, count: N+1)

for i in stride(from: 2, through: N, by: 1) {
    b[i] = b[i-1] + i
    t.append(t[i-1]+b[i])
    if t[i] > N { break }
}

memo[0] = 0

for i in 1...N {
    for emt in t where i - emt >= 0 {
        memo[i] = min(memo[i], memo[i-emt]+1)
    }
}

print(memo[N])