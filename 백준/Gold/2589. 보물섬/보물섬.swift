let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Character]]()

solveProblem()

func solveProblem() {
    inputGraph()
    findMaxDist()
}

func findMaxDist() {
    var answer = 0
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == "L" {
                answer = max(answer, bfs(i, j))
            }
        }
    }
    print(answer)
}

func inputGraph() {
    for _ in 0..<n {
        graph += [Array(readLine()!)]
    }
}

func bfs(_ i: Int, _ j: Int) -> Int {
    var visit = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    visit[i][j] = 0
    var max = 0
    var index = 0
    var queue = [[i, j]]
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
            let (nx, ny) = (x+i[0], y+i[1])
            if 0 <= nx && nx < n && 0 <= ny && ny < m {
                if graph[nx][ny] == "L" && visit[nx][ny] == -1 {
                    queue.append([nx, ny])
                    visit[nx][ny] = visit[x][y] + 1
                    if max < visit[nx][ny] {
                        max = visit[nx][ny]
                    }
                }
            }
        }
        index += 1
    }
    return max
}