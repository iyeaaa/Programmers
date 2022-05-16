import Foundation

let n = Int(readLine()!)!
var list = [Double]()
var dp = [Double](repeating: 1.0, count: n)

for _ in 0..<n {
    list.append(Double(readLine()!)!)
}

dp[0] = list[0]
for i in 1..<n {
    dp[i] = Double.maximum(dp[i-1]*list[i], list[i]) // 잇거나, 끊거나
}

print(String(format: "%.3f", round(dp.max()!*1000)/1000.0))

