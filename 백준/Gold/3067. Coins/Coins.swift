var result = ""
for _ in 0..<Int(readLine()!)! {
    result += "\(solve())\n"
}
print(result)

func solve() -> Int {
    let _ = Int(readLine()!)!
    let coins = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let M = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: M+1); dp[0] = 1

    for coin in coins {
        for i in coin...M {
            dp[i] &+= dp[i-coin]
        }
    }

    return dp[M]
}
