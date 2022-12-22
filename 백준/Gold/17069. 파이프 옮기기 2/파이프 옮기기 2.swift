let N = Int(readLine()!)!
var G = [[Int]]()
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 3), count: N), count: N)
let dy = [[0, 1], [1, 1], [0, 1, 1]]
let dx = [[1, 1], [0, 1], [1, 0, 1]]
let dn = [[0, 2], [1, 2], [0, 1, 2]]

for _ in 0..<N {
    G.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

dp[N-1][N-1] = [1, 1, 1]
print(dfs(0, 1, 0))

func dfs(_ y: Int, _ x: Int, _ d: Int) -> Int {
    if dp[y][x][d] != -1 {
        return dp[y][x][d]
    }
    dp[y][x][d] = 0
    for i in 0..<dy[d].count {
        let ny = y+dy[d][i], nx = x+dx[d][i], nd = dn[d][i]
        guard (0..<N) ~= ny && (0..<N) ~= nx else { continue }
        if nd == 2 && (G[ny-1][nx] == 1 || G[ny][nx-1] == 1) { continue }
        if G[ny][nx] == 1 { continue }
        dp[y][x][d] += dfs(ny, nx, nd)
    }
    return dp[y][x][d]
}