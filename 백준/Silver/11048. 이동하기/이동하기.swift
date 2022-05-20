let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
var dp = [[Int]](repeating: [Int](repeating: -1, count: m+1), count: n+1)
let direction = [[1, 0], [0, 1], [1, 1]]

for i in 1...n {
    let input = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}
    for j in 1...m {
        graph[i][j] = input[j]
    }
}

print(dfs(1, 1))

func dfs(_ x:Int, _ y: Int) -> Int {
    if x == n && y == m {
        return graph[x][y]
    }
    if dp[x][y] != -1 {
        return dp[x][y]
    }
    dp[x][y] = 0
    for i in direction {
        let (nx, ny) = (x+i[0], y+i[1])
        if (1...n).contains(nx) && (1...m).contains(ny) {
            let temp = dfs(nx, ny)
            if dp[x][y] < temp {
                dp[x][y] = temp
            }
        }
    }
    dp[x][y] += graph[x][y]
    return dp[x][y]
}
