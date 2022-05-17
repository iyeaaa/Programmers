let n = Int(readLine()!)!
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: 0, count: n)
dp[0] = list[0]

for i in 1..<list.count {
    for j in 1...i {
        if list[i] > list[i-j] {
            dp[i] = max(dp[i], dp[i-j]+list[i])
        }
    }
    dp[i] = max(list[i], dp[i])
}

print(dp.max()!)

