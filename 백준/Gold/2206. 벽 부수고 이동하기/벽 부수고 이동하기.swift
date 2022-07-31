let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let INF = 2
let (N, M) = (input[0], input[1])
let graph: [[Int]] = crtGraph()

// 접근한적 없음 INF, 안부숨 0, 부숨 1
var destory = (0..<N).map{ _ in (0..<M).map{ _ in INF } }
var queue = [(0, 0, 1)], idx = 0; destory[0][0] = 0
var result = -1

while idx < queue.count {
    let (y, x, cnt) = queue[idx]; idx += 1
    if y == N-1 && x == M-1 { result = cnt; break }
    for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
        if !((0..<N) ~= ny && (0..<M) ~= nx) { continue }
        if destory[y][x] == 1 && graph[ny][nx] == 1 { continue }
        if destory[ny][nx] <= destory[y][x] { continue }
        queue.append((ny, nx, cnt+1))
        destory[ny][nx] = (graph[ny][nx] == 0 ? destory[y][x] : 1)
    }
}
print(result)

func crtGraph() -> [[Int]] {
    var result = [[Int]]()
    for _ in 0..<N {
        result.append(Array(readLine()!).map{Int(String($0))!})
    }
    return result
}

