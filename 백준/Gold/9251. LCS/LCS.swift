import Foundation

let (str1, str2) = (Array(readLine()!), Array(readLine()!))
let (len1, len2) = (str1.count, str2.count)
var dp = Array(repeating: Array(repeating: 0, count: len2+1), count: len1+1)

for i in stride(from: 1, through: len1, by: 1) {
    for j in stride(from: 1, through: len2, by: 1) {
        if str1[i-1] == str2[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

print(dp[len1][len2])
