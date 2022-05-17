/*
 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 - 10 ( 10 )
 00, 01, 02, ..., 09, 11, ...19, - 55 (10 + 9 + 8 + 7 + ... + 1)
 000, 001, 002, 011 012 013 111 112 999 ((1~10) + (1~9) + (1~8) + ... + (1))

 */

var dp = [[Int]](repeating: [Int](repeating: 1, count: 10), count: 1001)

for i in 2...1000 {
    var sum = dp[i-1].reduce(0, +)
    for j in 0...9 {
        dp[i][j] = sum % 10007
        sum = (sum - dp[i-1][j])
    }
}

print(dp[Int(readLine()!)!].reduce(0, +) % 10007)