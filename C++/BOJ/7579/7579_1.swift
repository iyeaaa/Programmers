/**
* 메모리: 69104 KB, 시간: 36 ms
* 2022.09.30
* by Alub
*/
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let m = readLine()!.split(separator: " ").map{Int(String($0))!}
let c = readLine()!.split(separator: " ").map{Int(String($0))!}
var memo = [Int](repeating: Int.min, count: 10001); memo[0] = 0
var ans = Int.max

for (m, c) in zip(m, c) {
    for i in stride(from: 10000, through: c, by: -1) {
        memo[i] = max(memo[i], memo[i-c] + m)
        if memo[i] >= M { ans = min(ans, i) }
    }
}

print(ans)
