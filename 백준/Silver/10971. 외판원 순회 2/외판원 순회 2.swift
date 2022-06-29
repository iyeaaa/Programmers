let n = Int(readLine()!)!
let W = crtW()
var visit = [Bool](repeating: false, count: n)
var minValue = 10000000

for i in 0..<n {
    visit[i] = true
    dfs(i, 0, 1, i)
    visit[i] = false
}

print(minValue)

func dfs(_ cur: Int, _ sumCost: Int, _ digit: Int, _ start: Int) {
    if digit == n && W[cur][start] != 0 {
        minValue = min(minValue, sumCost+W[cur][start])
        return
    }
    for i in 0..<n {
        if W[cur][i] != 0 && !visit[i] {
            visit[i] = true
            dfs(i, sumCost+W[cur][i], digit+1, start)
            visit[i] = false
        }
    }
}


func crtW() -> [[Int]] {
    var result = [[Int]]()
    for _ in 0..<n {
        result.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }
    return result
}