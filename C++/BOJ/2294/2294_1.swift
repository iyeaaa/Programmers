/**
* 메모리: 69104 KB, 시간: 32 ms
* 2022.10.10
* by Alub
*/
// f(n) = n원을 만드는데 필요한 최소 동전 개수
// f(n) = min(f(n-c1), f(n-c2), f(n-c3), ....) + 1

let INF = 987654321
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var C = [Int](); for _ in 0..<N { C.append(Int(readLine()!)!) }
var memo = [Int](repeating: INF, count: K+1); memo[0] = 0

for i in 1...K {
    for c in C where i - c >= 0 {
        memo[i] = min(memo[i], memo[i-c]+1)
    }
}

print(memo[K] == INF ? -1 : memo[K])