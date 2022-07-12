let N = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: N)
for i in 0..<N {
    graph[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}
var dp = Array(repeating: Array(repeating: -1, count: N), count: N)

print(dfs(0, 0))

func dfs(_ y: Int, _ x: Int) -> Int {
    if y == N-1 && x == N-1 {
        return 1
    }
    if dp[y][x] != -1 {
        return dp[y][x]
    }
    dp[y][x] = 0
    for i in [[0, graph[y][x]], [graph[y][x], 0]] {
        let (ny, nx) = (y+i[0], x+i[1])
        if (0..<N) ~= ny && (0..<N) ~= nx {
            dp[y][x] += dfs(ny, nx)
        }
    }
    return dp[y][x]
}

