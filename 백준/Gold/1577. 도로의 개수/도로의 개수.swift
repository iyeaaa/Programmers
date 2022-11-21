
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
let k = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
var set = Set<[Int]>()

for _ in 0..<k {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (a, b, c, d) = (input[0], input[1], input[2], input[3])
    set.insert([a, b, c, d])
    set.insert([c, d, a, b])
}

dp[0][0] = 1
for i in 1...n where !set.contains([i, 0, i-1, 0]) {
    dp[i][0] = dp[i-1][0]
}

for i in 1...m where !set.contains([0, i, 0, i-1]) {
    dp[0][i] = dp[0][i-1]
}

for i in 1...n {
    for j in 1...m {
        var temp = 0
        if !set.contains([i, j, i-1, j]) {
            temp += dp[i-1][j]
        }
        if !set.contains([i, j, i, j-1]) {
            temp += dp[i][j-1]
        }
        dp[i][j] = temp
    }
}

print(dp[n][m])