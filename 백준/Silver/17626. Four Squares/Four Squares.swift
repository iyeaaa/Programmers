var dp = [Int](repeating: Int.max, count: 50001)
var special = [Int]()
var index = 1

for i in 1...50000 {
    if index*index == i {
        dp[i] = 1
        index += 1
    } else {
        var start = 1
        while start * start < i {
            dp[i] = min(dp[i], dp[i-start*start]+1)
            start += 1
        }
    }
}

print(dp[Int(readLine()!)!])

/*
 1^2 - 1
 1^2 + 1^2 - 2
 1^2 + 1^2 + 1^2 - 3
 2^2 - 4
 2^2 + 1^2 - 5
 2^2 + 1^2 + 1^2 - 6
 2^2 + 1^2 + 1^2 + 1^2 - 7
 2^2 + 2^2 - 8
 3^2 - 9
 3^2 + 1^2 - 10
 3^2 + 1^2 + 1^2 - 11
 2^2 + 2^2 + 2^2 - 12

 */