let n = Int(readLine()!)!
var grape = [Int](repeating: 0, count: 10001); crtGrape()
var dp = [Int](repeating: 0, count: 10001)
dp[0] = grape[0]
dp[1] = grape[0] + grape[1]
dp[2] = max(grape[0] + grape[2], grape[1] + grape[2], grape[0]+grape[1])

for i in stride(from: 3, to: n, by: 1) {
    dp[i] = max(dp[i-2]+grape[i], dp[i-1], dp[i-3]+grape[i-1]+grape[i])
}

print(dp.max()!)

func crtGrape() {
    for i in 0..<n {
        grape[i] = Int(readLine()!)!
    }
}