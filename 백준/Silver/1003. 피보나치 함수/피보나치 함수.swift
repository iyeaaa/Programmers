import Foundation

let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 41)
dp[0] = [1, 0]
dp[1] = [0, 1]
var result = ""

for i in 2...40 {
    dp[i] = [dp[i-1][0] + dp[i-2][0], dp[i-1][1] + dp[i-2][1]]
}

for _ in 0..<n {
    let N = Int(readLine()!)!
    result += "\(dp[N][0]) \(dp[N][1])\n"
}

print(result)