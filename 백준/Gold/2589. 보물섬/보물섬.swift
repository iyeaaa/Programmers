let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Character]]()
var land = [[Int]]()

solveProblem()

func solveProblem() {
    inputGraph()
    findLand()
    findMaxDist()
}

func findMaxDist() {
    var max = 0
    for i in land {
        let temp = bfs(i[0], i[1])
        if max < temp {
            max = temp
        }
    }
    print(max)
}

func inputGraph() {
    for _ in 0..<n {
        graph.append(Array(readLine()!))
    }
}

func findLand() {
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == "L" {
                land.append([i, j])
            }
        }
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
            if (0..<n).contains(nx) && (0..<m).contains(ny) {
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