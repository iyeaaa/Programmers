let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1]), area = N*M
var graph = [[Int]]()
var safeZone = [(Int, Int)]()
var wallCnt = 3
var queue = [(Int, Int)](), idx = 0
for _ in 0..<N {
    graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
for i in 0..<N {
    for j in 0..<M {
        if graph[i][j] == 2 {
            queue.append((i, j))
            continue
        }
        if graph[i][j] == 0 {
            safeZone.append((i, j))
            continue
        }
        if graph[i][j] == 1 {
            wallCnt += 1
        }
    }
}

var maxValue = -1
combination(0, 0)
print(maxValue)

func combination(_ idx: Int, _ digit: Int) {
    if digit == 3 {
        maxValue = max(maxValue, bfs())
        return
    }
    if idx >= safeZone.count {
        return
    }
    let (y, x) = safeZone[idx]
    graph[y][x] = 1
    combination(idx+1, digit+1)
    graph[y][x] = 0
    combination(idx+1, digit)
}

func bfs() -> Int {
    var graph = graph
    var queue = queue, idx = idx
    var virusCnt = 0
    while idx < queue.count {
        let (y, x) = queue[idx]; idx += 1
        for (ny, nx) in [(y-1,x),(y+1,x),(y,x+1),(y,x-1)] {
            if !((0..<N) ~= ny && (0..<M) ~= nx) { continue }
            if graph[ny][nx] != 0 { continue }
            queue.append((ny, nx))
            graph[ny][nx] = 2
            virusCnt += 1
        }
    }
    return safeZone.count - 3 - virusCnt
}