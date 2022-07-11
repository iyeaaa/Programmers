n, m = map(int, input().split())
dp = [[1 for _ in range(101)] for _ in range(101)]
for i in range(1, 101):
    for j in range(101):
        if j == 0 or j == i:
            continue
        dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
print(dp[n][m])
