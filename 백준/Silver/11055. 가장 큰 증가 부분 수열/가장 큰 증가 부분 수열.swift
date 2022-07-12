let N = Int(readLine()!)!
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = A

for i in 1..<N {
    for j in stride(from: i-1, through: 0, by: -1) {
        if A[j] < A[i] {
            dp[i] = max(dp[i], dp[j]+A[i])
        }
    }
}

print(dp.max()!)