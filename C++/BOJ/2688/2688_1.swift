/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.10.04
* by Alub
*/
var ans = ""
var memo = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 65)
memo[1] = [Int](repeating: 1, count: 10)

for i in 2...64 { memo[i][0] = 1 }

for i in 2...64 {
    for j in 1...9 {
        memo[i][j] = memo[i][j-1] + memo[i-1][j]
    }
}

for _ in 0..<Int(readLine()!)! {
    ans += "\(memo[Int(readLine()!)!].reduce(0, +))\n"
}

print(ans)