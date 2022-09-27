/**
* 메모리: 69108 KB, 시간: 8 ms
* 2022.09.27
* by Alub
*/
let N = Int(readLine()!)!
var L = [(A: 0, B: 0)]
var dp = [Int](repeating: 1, count: N+1)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    L.append((input[0], input[1]))
}

L.sort{$0.A < $1.A}

for i in 1...N {
    for j in 1..<i where L[j].B < L[i].B {
        dp[i] = max(dp[i], dp[j]+1)
    }
}

print(N - dp.max()!)