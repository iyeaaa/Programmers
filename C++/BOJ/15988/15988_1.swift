/**
* 메모리: 76916 KB, 시간: 40 ms
* 2022.09.29
* by Alub
*/
var ans = ""
var memo = [Int](repeating: 0, count: 1_000_001)
memo[1] = 1; memo[2] = 2; memo[3] = 4

for i in 4...1_000_000 {
    memo[i] = (memo[i-1] + memo[i-2] + memo[i-3]) % 1_000_000_009
}

for _ in 0..<Int(readLine()!)! {
    ans += "\(memo[Int(readLine()!)!])\n"
}

print(ans)