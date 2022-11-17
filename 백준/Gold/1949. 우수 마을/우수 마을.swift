
let n = Int(readLine()!)!
var c = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var g = [[Int]](repeating: [], count: n+1)
var v = [Bool](repeating: false, count: n+1)
var dp = [[Int]](repeating: [0, 0], count: n+1)

for _ in 0..<n-1 {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    g[input[0]].append(input[1])
    g[input[1]].append(input[0])
}

f(1)
print(dp[1].max()!)

func f(_ cur: Int) {
    v[cur] = true
    dp[cur][0] = 0; dp[cur][1] = c[cur]
    for next in g[cur] where !v[next] {
        f(next)
        dp[cur][0] += dp[next].max()!
        dp[cur][1] += dp[next][0]
    }
}