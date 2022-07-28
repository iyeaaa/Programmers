

let N = Int(readLine()!)!
let graph: [[Int]] = crtGraph()
var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

var count = [Int]()
for i in 0..<N {
    for j in 0..<N {
        if graph[i][j] == 1 && !visit[i][j] {
            count.append(bfs(i, j))
        }
    }
}

count.sort()
var result = "\(count.count)\n"
for c in count {
    result += "\(c)\n"
}
print(result)

func bfs(_ y: Int, _ x: Int) -> Int {
    var count = 1
    var queue = [(y, x)], idx = 0; visit[y][x] = true
    while idx < queue.count {
        let (y, x) = queue[idx]; idx += 1
        for (ny, nx) in [(y-1, x), (y+1, x), (y, x+1), (y, x-1)] {
            if (0..<N) ~= ny && (0..<N) ~= nx && !visit[ny][nx] && graph[ny][nx] == 1 {
                queue.append((ny, nx))
                visit[ny][nx] = true
                count += 1
            }
        }
    }
    return count
}

func crtGraph() -> [[Int]] {
    var result = [[Int]]()
    for _ in 0..<N {
        result.append(readLine()!.map{Int(String($0))!})
    }
    return result
}