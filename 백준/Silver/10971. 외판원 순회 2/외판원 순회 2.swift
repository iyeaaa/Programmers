let N = Int(readLine()!)!
var W = [[Int]]()
var visit = [Bool](repeating: false, count: N)
for _ in 0..<N {
    W.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

var minValue = Int.max
func dfs(_ start: Int, _ sum: Int, _ digit: Int, _ cur: Int) {
    if sum >= minValue { return }
    if digit == N {
        if W[cur][start] == 0 { return }
        minValue = min(minValue, sum+W[cur][start])
        return
    }
    for i in 0..<N {
        if !visit[i] && W[cur][i] != 0 {
            visit[i] = true
            dfs(start, sum + W[cur][i], digit+1, i)
            visit[i] = false
        }
    }
}

visit[0] = true
dfs(0, 0, 1, 0)
print(minValue)