var result = ""

while true {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (m, n) = (input[0], input[1])
    var count = 0

    if n == 0 && m == 0 {
        break
    }
    var graph = [[Int]]()

    for _ in 0..<n {
        graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }

    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 1 {
                count += 1
                bfs(start: i, end: j, graph: &graph, n: n, m: m)
            }
        }
    }

    result += "\(count)\n"
}

print(result)

func bfs(start: Int, end: Int, graph: inout [[Int]], n: Int, m: Int) {
    var queue = [[start, end]]
    var index = 0
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1], [-1, -1], [-1, 1], [1, -1], [1, 1]] {
            let (nx, ny) = (x + i[0], y + i[1])
            if !(0..<n).contains(nx) || !(0..<m).contains(ny) {
                continue
            }
            if graph[nx][ny] == 0 {
                continue
            }
            queue.append([nx, ny])
            graph[nx][ny] = 0
        }
        index += 1
    }
}