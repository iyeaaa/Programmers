
let MAX = 1<<15
var dp = [[Int]](repeating: [Int](repeating: 0, count: 5), count: MAX+1)
dp[0][0] = 1

for i in 1... {
    let cur = i*i
    if cur > MAX { break }
    for j in 1...4 {
        for k in stride(from:MAX,through:cur,by:-1) {
            dp[k][j] += dp[k-cur][j-1]
        }
    }
}

while true {
    let N = Int(readLine()!)!
    if N == 0 {break}
    print(dp[N].reduce(0, +))
}