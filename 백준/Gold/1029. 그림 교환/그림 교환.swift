
let n = Int(readLine()!)!
var g = [[0]]
var dp = (0...n).map{_ in (0...1<<16).map{_ in (0...9).map{_ in -1}}}
var ans = 1

for _ in 0..<n {
    g.append([0]+Array(readLine()!).map{Int(String($0))!})
}

print(f(1, 2, 0))

func f(_ cur: Int, _ v: Int, _ l: Int) -> Int {
    if dp[cur][v][l] != -1 { return dp[cur][v][l] }
    var temp = 1
    for next in 1...n where cur != next {
        if v & (1 << next) != 0 { continue }
        if g[cur][next] < l { continue }
        temp = max(temp, f(next, v | 1 << next, g[cur][next]) + 1)
    }
    dp[cur][v][l] = temp
    return dp[cur][v][l]
}