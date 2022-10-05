/**
* 메모리: 69892 KB, 시간: 12 ms
* 2022.10.05
* by Alub
*/
var memo = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 10001)
var ans = ""

memo[1][1] = 1
memo[2][1] = 1; memo[2][2] = 1
memo[3][1] = 1; memo[3][2] = 1; memo[3][3] = 1

for i in 4...10000 {
    for j in 1...3 {
        memo[i][j] = memo[i-j][...j].reduce(0, +)
    }
}

for _ in 0..<Int(readLine()!)! {
    ans += "\(memo[Int(readLine()!)!].reduce(0, +))\n"
}

print(ans)
