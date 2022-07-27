let _ = readLine()
let (strn1, strn2) = (["0"]+Array(readLine()!), ["0"]+Array(readLine()!))
let (len1, len2) = (strn1.count-1, strn2.count-1)
var dp = [[Int]](repeating: [Int](repeating: 0, count: len2+1), count: len1+1)

for i in 1...len1 { dp[i][0] = i }
for i in 1...len2 { dp[0][i] = i }

for i in 1...len1 {
    for j in 1...len2 {
        if strn1[i] == "i" && (strn2[j] == "j" || strn2[j] == "l") {
            dp[i][j] = dp[i-1][j-1]
        } else if strn1[i] == "v" && strn2[j] == "w" {
            dp[i][j] = dp[i-1][j-1]
        } else if strn1[i] == strn2[j] {
            dp[i][j] = dp[i-1][j-1]
        } else {
            dp[i][j] = min(dp[i][j-1], dp[i-1][j-1], dp[i-1][j]) + 1
        }
    }
}

print(dp[len1][len2])