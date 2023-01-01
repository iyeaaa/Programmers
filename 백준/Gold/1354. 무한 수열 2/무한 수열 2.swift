
var dp = [Int: Int]()
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, P, Q, X, Y) = (ip[0], ip[1], ip[2], ip[3], ip[4])

print(A(N))

func A(_ i: Int) -> Int {
    if i <= 0 { return 1 }
    if dp[i, default:-1] != -1 { return dp[i]! }
    dp[i] = A(i/P-X) + A(i/Q-Y)
    return dp[i]!
}