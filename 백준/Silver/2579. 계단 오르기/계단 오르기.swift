let n = Int(readLine()!)!
var stair = [Int](repeating: 0, count: n+1)
var dp = [Int](repeating: 0, count: n+1)

for i in 1...n {
    stair[i] = Int(readLine()!)!
}

if n == 1 {
    print(stair[1])
} else if n == 2 {
    print(stair[1] + stair[2])
} else if n == 3 {
    print(max(stair[1], stair[2])+stair[3])
} else {
    (dp[1], dp[2], dp[3]) =
            (stair[1], stair[1]+stair[2], max(stair[1], stair[2])+stair[3])


    for i in stride(from: 4, through: n, by: 1) {
        dp[i] = max(stair[i-1]+dp[i-3], dp[i-2]) + stair[i]
    }

    print(dp[n])
}


