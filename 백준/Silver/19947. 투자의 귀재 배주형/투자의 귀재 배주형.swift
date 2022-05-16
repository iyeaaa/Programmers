import Foundation

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (h, y) = (input[0], input[1])
var dp = [Int](repeating: 0, count: 11)
dp[0] = h

for i in 1...2 {
    dp[i] = Int(floor(Double(dp[i-1])*1.05))
}

for i in 3...4 {
    dp[i] = max(Int(floor(Double(dp[i-1])*1.05))
            , Int(floor(Double(dp[i-3])*1.2)))
}

for i in stride(from: 5, through: y, by: 1) {
    dp[i] = max(Int(floor(Double(dp[i-1])*1.05))
            , Int(floor(Double(dp[i-3])*1.2))
            , Int(floor(Double(dp[i-5])*1.35)))
}

print(dp[y])