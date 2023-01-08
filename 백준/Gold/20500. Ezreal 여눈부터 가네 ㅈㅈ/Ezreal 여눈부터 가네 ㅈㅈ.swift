
let FIVE = 1, ONE = 0, MOD = 1_000_000_007
let N = Int(readLine()!)!
var dp = [[[Int]]](repeating:[[Int]](repeating:[Int](repeating:0,count:2),count:3),count:N+1)

dp[1][1][ONE] = 1
dp[1][2][FIVE] = 1

for i in 1..<N {
    for j in 0...2 {
        dp[i+1][(j+1)%3][ONE] = (dp[i+1][(j+1)%3][ONE] + dp[i][j][ONE]) % MOD
        dp[i+1][(j+1)%3][ONE] = (dp[i+1][(j+1)%3][ONE] + dp[i][j][FIVE]) % MOD
        dp[i+1][(j+5)%3][FIVE] = (dp[i+1][(j+5)%3][FIVE] + dp[i][j][ONE]) % MOD
        dp[i+1][(j+5)%3][FIVE] = (dp[i+1][(j+5)%3][FIVE] + dp[i][j][FIVE]) % MOD
    }
}

print(dp[N][0][FIVE])