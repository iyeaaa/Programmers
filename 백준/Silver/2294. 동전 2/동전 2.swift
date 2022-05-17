import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var coin = [Int]()
var dp = [Int](repeating: 10001, count: k+1)
dp[0] = 0

for i in 0..<n {
    coin.append(Int(readLine()!)!)
}

for c in coin {
    for i in stride(from: c, through: k, by: 1) {
        dp[i] = min(dp[i-c] + 1, dp[i])
    }
}

print( dp[k]==10001 ? -1 : dp[k] )
