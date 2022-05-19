let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]](repeating: [], count: n+1)
var dp = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var safe = [[Int]]()
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]

for i in 0..<n {
    graph[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}

print(dfs(0, 0))

func dfs(_ x: Int, _ y: Int) -> Int {
    if x == n-1 && y == m-1 {
        return 1
    }
    if dp[x][y] != -1 {
        return dp[x][y]
    }

    dp[x][y] = 0
    for i in direction {
        let (nx, ny) = (x+i[0], y+i[1])
        if (0..<n).contains(nx) && (0..<m).contains(ny)
                   && graph[x][y] > graph[nx][ny] {
            dp[x][y] += dfs(nx, ny)
        }
    }
    return dp[x][y]
}