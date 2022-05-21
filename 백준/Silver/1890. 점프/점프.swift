import Foundation

let n = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n)
var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
for i in 0..<n {
    graph[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}

print(dfs(0, 0))

func dfs(_ x: Int, _ y: Int) -> Int {
    if x == n-1 && y == n-1 {
        return 1
    }
    if dp[x][y] != -1 {
        return dp[x][y]
    }
    dp[x][y] = 0
    for i in [[0, graph[x][y]], [graph[x][y], 0]] {
        let (nx, ny) = (x+i[0], y+i[1])
        if (0..<n).contains(nx) && (0..<n).contains(ny) {
            dp[x][y] += dfs(nx, ny)
        }
    }
    return dp[x][y]
}