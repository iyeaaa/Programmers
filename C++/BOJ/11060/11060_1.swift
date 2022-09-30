/**
* 메모리: 69104 KB, 시간: 12 ms
* 2022.09.30
* by Alub
*/
let N = Int(readLine()!)!
let M = readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = [Int](repeating: 999999999, count: N); memo[0] = 0

for i in 1..<N {
    for j in 0..<i where j + M[j] >= i {
        memo[i] = min(memo[i], memo[j]+1)
    }
}

print(memo[N-1] == 999999999 ? -1 : memo[N-1])