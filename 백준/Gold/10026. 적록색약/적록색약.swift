let n = Int(readLine()!)!
var graph = [[String]]()
var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for _ in 0..<n {
    graph.append(Array(readLine()!).map{String($0)})
}

var count1 = 0
for i in 0..<n {
    for j in 0..<n {
        if !visit[i][j] {
            count1 += 1
            bfs(i, j, graph[i][j])
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == "G" {
            graph[i][j] = "R"
        }
    }
}

visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

var count2 = 0
for i in 0..<n {
    for j in 0..<n {
        if !visit[i][j] {
            count2 += 1
            bfs(i, j, graph[i][j])
        }
    }
}

print(count1, count2)

func bfs(_ i: Int, _ j: Int, _ color: String) {
    var queue = [[i, j]]
    var index = 0
    visit[i][j] = true
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
            let (nx, ny) = (x + i[0], y + i[1])
            if !(0..<n).contains(nx) || !(0..<n).contains(ny) {
                continue
            }
            if graph[nx][ny] == color && !visit[nx][ny] {
                queue.append([nx, ny])
                visit[nx][ny] = true
            }
        }
        index += 1
    }
}

