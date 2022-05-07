let n = Int(readLine()!)!
var graph = [[Int]]()
var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for _ in 0..<n {
    graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

var max = 1
for c in 1...100 {
    var count = 0
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] > c && !visit[i][j] {
                count += 1
                bfs(i, j, c)
            }
        }
    }
    if max < count {
        max = count
    }
    visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
}

print(max)

func bfs(_ i: Int, _ j: Int, _ height: Int) {
    var queue = [[i, j]]
    var index = 0
    visit[i][j] = true
    while index < queue.count {
        let (x, y) = (queue[index][0], queue[index][1])
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
            let (nx, ny) = (x + i[0], y + i[1])
            if (0..<n).contains(nx) && (0..<n).contains(ny) {
                if !visit[nx][ny] && graph[nx][ny] > height {
                    queue.append([nx, ny])
                    visit[nx][ny] = true
                }
            }
        }
        index += 1
    }
}