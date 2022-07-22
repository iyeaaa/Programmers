
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let prefixSum: [Int] = crtPrefixSum()
let INF = -32768*100
var dp = [[Int]](repeating: [Int](repeating: INF, count: M+1), count: N+1)
var isVisit = [[Bool]](repeating: [Bool](repeating: false, count: M+1), count: N+1)

print(f(N, M))

func f(_ n: Int, _ m: Int) -> Int {
    if m == 0 { return 0 }
    if n < 0 { return INF }
    if isVisit[n][m] { return dp[n][m] }

    isVisit[n][m] = true
    dp[n][m] = f(n-1, m)
    for i in stride(from: n, to: 0, by: -1) {
        dp[n][m] = max(dp[n][m], f(i-2, m-1) + prefixSum[n]-prefixSum[i-1])
    }
    return dp[n][m]
}


func crtPrefixSum() -> [Int] {
    var result = [0]
    for i in 1...N {
        result.append(result[i-1]+Int(readLine()!)!)
    }
    return result
}

