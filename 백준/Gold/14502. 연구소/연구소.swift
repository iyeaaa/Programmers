let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]]()
var virus_p = [[Int]]()
var safe_p = [[Int]]()

inputGraph()
areaFind()

var max = 0
for i in 0..<safe_p.count {
    for j in i+1..<safe_p.count {
        for k in j+1..<safe_p.count {
            graph[safe_p[i][0]][safe_p[i][1]] = 1
            graph[safe_p[j][0]][safe_p[j][1]] = 1
            graph[safe_p[k][0]][safe_p[k][1]] = 1
            let temp = bfs(graph)
            if max < temp {
                max = temp
            }
            graph[safe_p[i][0]][safe_p[i][1]] = 0
            graph[safe_p[j][0]][safe_p[j][1]] = 0
            graph[safe_p[k][0]][safe_p[k][1]] = 0
        }
    }
}

print(max)

func inputGraph() {
    for _ in 0..<n {
        graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }
}

func areaFind() {
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 2 {
                virus_p.append([i, j])
            }
            if graph[i][j] == 0 {
                safe_p.append([i, j])
            }
        }
    }
}

func notInfectedLocalSearch(graph: [[Int]]) -> Int {
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 0 {
                count += 1
            }
        }
    }
    return count
}

func bfs(_ graph_t: [[Int]]) -> Int {
    var graph = graph_t
    var queue = virus_p
    var index = 0
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
            let (nx, ny) = (x + i[0], y + i[1])
            if !(0..<n).contains(nx) || !(0..<m).contains(ny) {
                continue
            }
            if graph[nx][ny] != 0 {
                continue
            }
            queue.append([nx, ny])
            graph[nx][ny] = 2
        }
        index += 1
    }
    return notInfectedLocalSearch(graph: graph)
}