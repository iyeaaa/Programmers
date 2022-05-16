var dp = [Int](repeating: Int.max, count: 100001)
var special = [Int]()
var index = 1

for i in 1...100000 {
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