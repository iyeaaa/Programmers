let n = Int(readLine()!)!
let card = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: 0, count: n+1)

for i in 1..<card.count {
    for j in stride(from: i, through: n, by: 1) {
        dp[j] = max(dp[j-i] + card[i], dp[j])
    }
}

print(dp[n])