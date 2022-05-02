import Foundation

let n = Int(readLine()!)!
var array = [Int]()
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 41)
dp[0][0] = 0
dp[0][1] = 1
dp[0][2] = 0
dp[1][0] = 0
dp[1][1] = 0
dp[1][2] = 1
var result = ""

for i in 2...40 {
    for j in 0...2 {
        dp[i][j] = dp[i-1][j] + dp[i-2][j]
    }
}

for _ in 0..<n {
    let temp = Int(readLine()!)!
    result += "\(dp[temp][1]) \(dp[temp][2])\n"
}

print(result)