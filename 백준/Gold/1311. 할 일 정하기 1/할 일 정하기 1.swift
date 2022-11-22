
let n = Int(readLine()!)!
var d = [[0]]
var dp = (0...n).map{_ in (0...1<<(n+1)).map{_ in -1}}

for _ in 0..<n {
    d.append([0]+readLine()!.split{$0==" "}.map{Int(String($0))!})
}

print(f(1, 0))

func f(_ cur: Int, _ v: Int) -> Int {
    if cur == n+1 { return 0 }
    if dp[cur][v] != -1 { return dp[cur][v] }
    var temp = Int.max
    for work in 1...n where v & (1<<work) == 0 {
        temp = min(temp, f(cur+1, v | 1<<work) + d[cur][work])
    }
    dp[cur][v] = temp
    return temp
}