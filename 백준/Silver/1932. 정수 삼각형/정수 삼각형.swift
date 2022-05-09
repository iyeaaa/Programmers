let n = Int(readLine()!)!
var array = [[Int]]()
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for i in 0..<n {
    array.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}
for i in 0..<n {
    dp[n-1][i] = array[n-1][i]
}

for i in stride(from: n-2, through: 0, by: -1) {
    for j in stride(from: 0, to: array[i].count, by: 1) {
        dp[i][j] = max(dp[i+1][j], dp[i+1][j+1]) + array[i][j]
    }
}

print(dp[0][0])