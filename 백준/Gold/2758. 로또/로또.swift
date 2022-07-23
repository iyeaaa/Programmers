var dp = Array(repeating: Array(repeating: -1, count: 2001), count: 11)
var result = ""
for _ in 1...Int(readLine()!)! {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m) = (input[0], input[1])
    var sum = 0
    for i in 1...m {
        sum += solve(n, i)
    }
    result += "\(sum)\n"

    func solve(_ n: Int, _ m: Int) -> Int {
        if n > m { return 0 }
        if m == 1 || n == 1 { return 1 }
        if dp[n][m] != -1 { return dp[n][m] }
        if m % 2 == 1 { return solve(n, m-1) }

        dp[n][m] = 0
        for k in stride(from: 1, through: m/2, by: 1) {
            dp[n][m] += solve(n-1, k)
        }
        return dp[n][m]
    }
}
print(result)

