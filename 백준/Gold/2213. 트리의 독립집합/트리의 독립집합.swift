
let n = Int(readLine()!)!
let w = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}
var g = [[Int]](repeating: [], count: n+1)
var v = [Bool](repeating: false, count: n+1)
var dp = [[Int]](repeating: [0, 0], count: n+1)
var path = [[Int]](repeating: [], count: n+1)
var ans = [Int]()

for _ in 0..<n-1 {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    g[input[0]].append(input[1])
    g[input[1]].append(input[0])
}

f(1)
print(dp[1].max()!)
v = [Bool](repeating: false, count: n+1)
trace(1)
print(ans.sorted().map{String($0)}.joined(separator: " "))

func trace(_ cur: Int, _ prev: Int = 0) {
    if !v[prev] && dp[cur][1] > dp[cur][0]  {
        ans.append(cur)
        v[cur] = true
    }
    for i in g[cur] where i != prev {
        trace(i, cur)
    }
}

func f(_ cur: Int) {
    v[cur] = true
    var not_chose = 0, chose = w[cur]
    for next in g[cur] where !v[next] {
        f(next)
        not_chose += dp[next].max()!
        chose += dp[next][0]
    }
    dp[cur] = [not_chose, chose]
}