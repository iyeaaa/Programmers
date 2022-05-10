let n = Int(readLine()!)!
var list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: list[0], count: n)

for i in 1..<list.count {
    dp[i] = max(dp[i-1] + list[i], list[i])
}

print(dp.max()!)
