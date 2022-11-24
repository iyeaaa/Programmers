
var p = [(0, 0)]
var dp = (0...1000).map{_ in (0...15).map{_ in (0...15).map{_ in Int.min}}}

while let input = readLine() {
    let inp = input.split{$0==" "}.map{Int(String($0))!}
    p.append((inp[0], inp[1]))
}

dp[0][0][0] = 0
for i in 1..<p.count {
    let (W, B) = p[i]
    for j in 0...15 {
        for k in 0...15 {
            var temp = dp[i-1][j][k]
            if j > 0 { temp = max(temp, dp[i-1][j-1][k] + W) }
            if k > 0 { temp = max(temp, dp[i-1][j][k-1] + B) }
            dp[i][j][k] = temp
        }
    }
}

print(dp[p.count-1][15][15])