import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: Int.max, count: n+1)

for i in 1...n {
    if i*i <= n { dp[i*i] = 1 }

    if dp[i] == Int.max {
        var j = 1
        var powJ = j*j
        while powJ <= i {
            dp[i] = min(dp[i], dp[powJ]+dp[i-powJ])
            j += 1
            powJ = j*j
        }
    }
}

print(dp[n])