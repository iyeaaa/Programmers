
var ans = ""
while true {
    func column_max(_ y: Int, _ x: Int) -> Int {
        if x < 0 { return 0 }
        if x <= 1 { return g[y][x] }
        if column_dp[y][x] != -1 { return column_dp[y][x] }
        column_dp[y][x] = max(column_max(y, x-2), column_max(y, x-3)) + g[y][x]
        return column_dp[y][x]
    }

    func row_max(_ y: Int) -> Int {
        if y < 0 { return 0 }
        if y <= 1 { return max(column_max(y, n-1), column_max(y, n-2)) }
        if row_dp[y] != -1 { return row_dp[y] }
        row_dp[y] = max(row_max(y-2), row_max(y-3)) + max(column_max(y, n-1), column_max(y, n-2))
        return row_dp[y]
    }

    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (m, n) = (input[0], input[1])
    var column_dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
    var row_dp = [Int](repeating: -1, count: m)
    var g = [[Int]]()

    if m == 0 && n == 0 { break }

    for _ in 0..<m {
        g.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }

    ans += "\(max(row_max(m-1), row_max(m-2)))\n"
}

print(ans)