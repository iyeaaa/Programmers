let N = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: N)
for i in 0..<N {
    graph[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}
var dp = Array(repeating: Array(repeating: -1, count: N), count: N)
var count = 0

print(dfs(0, 0))

func dfs(_ y: Int, _ x: Int) -> Int {
    if y == N-1 && x == N-1 {
        return 1
    }
    if dp[y][x] != -1 {
        return dp[y][x]
    }
    dp[y][x] = 0
    for i in [[y+graph[y][x], x], [y, x+graph[y][x]]] {
        if (0..<N) ~= i[0] && (0..<N) ~= i[1] {
            dp[y][x] += dfs(i[0], i[1])
        }
    }
    return dp[y][x]
}

