let n = Int(readLine()!)!
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: 1, count: n)

for i in 1..<list.count {
    for j in 1...i {
        if list[i] < list[i-j] {
            dp[i] = max(dp[i], dp[i-j]+1)
        }
    }
}

print(dp.max()!)

