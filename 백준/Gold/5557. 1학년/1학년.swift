import Foundation


let N = Int(readLine()!)!
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [[Int]](repeating: [Int](repeating: 0, count: 21), count: N-1)

dp[0][list[0]] += 1
for i in 1..<N-1 {
    for j in 0...20 {
        if dp[i-1][j] == 0 { continue }
        if (0...20) ~= j+list[i] {
            dp[i][j+list[i]] &+= dp[i-1][j]
        }
        if (0...20) ~= j-list[i] {
            dp[i][j-list[i]] &+= dp[i-1][j]
        }
    }
}
print(dp[N-2][list[N-1]])