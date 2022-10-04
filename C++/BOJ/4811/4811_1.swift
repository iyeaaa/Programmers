/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.10.04
* by Alub
*/
var memo = [[Double]](repeating: [Double](repeating: 0, count: 32), count: 31)

for i in 0...30 {
    memo[0][i] = 1
}

for i in 1...30 {
    for j in 0...30 {
        memo[i][j] = (j == 0 ? memo[i-1][1] : memo[i-1][j+1]+memo[i][j-1])
    }
}

var ans = ""
while let N = Int(readLine()!), N != 0 {
    ans += "\(Int(memo[N-1][1]))\n"
}
print(ans)