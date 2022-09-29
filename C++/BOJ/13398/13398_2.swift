/**
* 메모리: 76112 KB, 시간: 36 ms
* 2022.09.29
* by Alub
*/
var n = Int(readLine()!)!
let S = readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = Array(zip(S, S))
var ans = S[0]

for i in stride(from: 1, to: n, by: 1) {
    memo[i].0 = max(memo[i].0, memo[i-1].0 + S[i])
    memo[i].1 = max(memo[i].1, memo[i-1].0, memo[i-1].1 + S[i])
    ans = max(ans, memo[i].0, memo[i].1)
}

print(ans)