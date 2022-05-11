let n = Int(readLine()!)!
var list = [Int]()
var dp = [Int](repeating: 0, count: n)

for _ in 0..<n {
    list.append(Int(readLine()!)!)
}

if n == 1 {
    print(list[0])
} else if n == 2 {
    print(list[0]+list[1])
} else if n == 3 {
    print(max(list[0]+list[2], list[0]+list[2], list[0]+list[1]))
} else {
    dp[0] = list[0]
    dp[1] = list[0]+list[1]
    dp[2] = max(dp[1], list[0]+list[2], list[1]+list[2])

    for i in stride(from: 3, to: n, by: 1) {
        dp[i] = max(dp[i-2]+list[i], dp[i-3]+list[i-1]+list[i], dp[i-1])
    }

    print(dp[n-1])
}



