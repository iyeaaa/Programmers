/**
* 메모리: 88112 KB, 시간: 128 ms
* 2022.09.30
* by Alub
*/
let N = Int(readLine()!)!
let a = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
let b = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = [Int](repeating: 0, count: N+1)
var s = 0

for i in 1...N where b[i] == 1 { s += a[i] }
memo[1] = b[1] == 0 ? s + a[1] : s - a[1]

var ans = memo[1]

for i in stride(from: 2, through: N, by: 1) {
    memo[i] = b[i] == 0 ? s + a[i] : s - a[i]
    if b[i] == 1 {
        memo[i] = max(memo[i], memo[i-1] - a[i])
    } else {
        memo[i] = max(memo[i], memo[i-1] + a[i])
    }
    ans = max(ans, memo[i])
}

print(ans)