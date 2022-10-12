/**
* 메모리: 69104 KB, 시간: 20 ms
* 2022.10.12
* by Alub
*/
// f(n): n번째 숫자까지 중 순증가 부분수열 길이의 최댓값
// f(n) = max(f(0~n-1)) + 1

let N = Int(readLine()!)!
let L = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = [Int](repeating: 1, count: N+1)

for i in 1...N {
    for j in 1..<i where L[j] < L[i] {
        memo[i] = max(memo[i], memo[j] + 1)
    }
}

print(memo.max()!)