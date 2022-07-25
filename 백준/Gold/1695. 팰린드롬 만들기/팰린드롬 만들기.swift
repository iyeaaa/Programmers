let N = Int(readLine()!)!
let list1 = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}
let list2 = [0] + list1.reversed()
var dp = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)

for i in stride(from: 1, through: N, by: 1) {
    for j in stride(from: 1, through: N, by: 1) {
        dp[i][j] = list1[i] == list2[j] ? dp[i-1][j-1] + 1 : max(dp[i-1][j], dp[i][j-1])
    }
}

print(N - dp[N][N])