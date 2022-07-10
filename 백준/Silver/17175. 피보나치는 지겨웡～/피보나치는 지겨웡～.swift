var dp = [Int](repeating: -1, count: 51);
dp[0] = 1
dp[1] = 1
print(fibonacci(Int(readLine()!)!))

func fibonacci(_ n: Int) -> Int { // 호출
    if dp[n] != -1 {
        return dp[n]
    }
    dp[n] = (fibonacci(n-1) + fibonacci(n-2) + 1) % 1_000_000_007
    return dp[n]
}
