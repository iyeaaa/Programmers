/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.09.27
* by Alub
*/
let N = Int(readLine()!)!
var T = [Int](repeating: 0, count: N+1)
var P = [Int](repeating: 0, count: N+1)
var dp = [Int](repeating: 0, count: N+1)
var ans = Int.min

for i in 1...N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    T[i] = input[0]; P[i] = input[1]
}

for i in 1...N where i + T[i] <= N+1 {
    dp[i] = P[i]
}

for i in stride(from: 2, through: N, by: 1) where i + T[i] <= N+1 {
    for j in 1..<N where T[j] + j <= i {
        dp[i] = max(dp[i], dp[j] + P[i])
    }
}

print(dp.max()!)