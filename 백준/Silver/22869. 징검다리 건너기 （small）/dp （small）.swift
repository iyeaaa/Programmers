let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var A = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Bool](repeating: false, count: 5001); dp[1] = true

for i in 1...N {
    if !dp[i] { continue }
    for j in i...N {
        if (j-i)*(1+abs(A[i]-A[j])) > K { continue }
        dp[j] = true
    }
}

print(dp[N] ? "YES" : "NO")
