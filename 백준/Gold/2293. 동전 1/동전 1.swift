import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var coin = [Int]()
var dp = [Int](repeating: 0, count: k+1)

for _ in 0..<n {
    coin.append(Int(readLine()!)!)
}

coin.sort()

dp[0] = 1
for c in coin {
    for i in stride(from: c, through: k, by: 1) {
        if dp[i] + dp[i-c] >= Int(pow(2.0, 31.0)) {
            dp[i] = 0
        }
        dp[i] += dp[i-c]
    }
}

print(dp[k])