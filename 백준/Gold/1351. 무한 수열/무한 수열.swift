let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, P, Q) = (input[0], input[1], input[2])
var dp = [0: 0]

print(A(N))

func A(_ i: Int) -> Int {
    if i == 0 {
        return 1
    }
    if let cur = dp[i] {
        return cur
    }
    dp[i] = A(i/P) + A(i/Q)
    return dp[i]!
}