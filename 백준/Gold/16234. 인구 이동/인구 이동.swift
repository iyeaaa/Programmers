let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, L, R) = (input[0], input[1], input[2])
var graph = [[Int]]()
var graph_Temp = [[Int]]()
var visit = [[Int]]()
let direction = [[-1, 0], [0, -1], [1, 0], [0, 1]]
var day = 0


makeGraph()
searchGraph()
print(day)


func makeGraph() {
    for _ in 0..<N {
        graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }
    graph_Temp = graph
}

func searchGraph() {
    while true {
        visit = [[Int]](repeating: [Int](repeating: -1, count: N), count: N)
        for i in 0..<N {
            for j in 0..<N {
                if visit[i][j] == -1 {
                    bfs(i, j)
                }
            }
        }
        if equal {
            break
        } else {
            day += 1
            graph = graph_Temp
        }
    }
}

var equal: Bool {
    for i in 0..<N {
        for j in 0..<N {
            if graph[i][j] != graph_Temp[i][j] {
                return false
            }
        }
    }
    return true
}

func changeToAverage(_ sum: Int, _ nation: [[Int]]) {
    let average = sum / nation.count
    for i in nation {
        graph_Temp[i[0]][i[1]] = average
    }
}

func bfs(_ i: Int, _ j: Int) {
    var index = 0
    var queue = [[i, j]]
    var sum = graph[i][j]
    visit[i][j] = 1
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for i in direction {
            let (nx, ny) = (x+i[0], y+i[1])
            if (0..<N).contains(nx) && (0..<N).contains(ny) {
                let differ = abs(graph[nx][ny] - graph[x][y])
                if differ >= L && differ <= R && visit[nx][ny] == -1 {
                    visit[nx][ny] = 1
                    queue.append([nx, ny])
                    sum += graph[nx][ny]
                }
            }
        }
        index += 1
    }
    changeToAverage(sum, queue)
}