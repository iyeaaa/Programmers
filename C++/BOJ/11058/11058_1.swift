/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.10.06
* by Alub
*/
let N = Int(readLine()!)!
var memo = [Int](repeating: 0, count: 101)

for i in 1...6 { memo[i] = i }

for i in stride(from: 7, through: N, by: 1) {
    memo[i] = memo[i-1] + 1
    for j in 2...4 {
        memo[i] = max(memo[i], memo[i-(j+1)]*j)
    }
}

print(memo[N])