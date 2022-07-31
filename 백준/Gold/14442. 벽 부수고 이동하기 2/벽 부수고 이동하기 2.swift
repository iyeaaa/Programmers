let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, K) = (input[0], input[1], input[2])
let graph: [[Int]] = crtGraph()

var destory = (0..<N).map{ _ in (0..<M).map{ _ in -1 } }
var queue = [(0, 0, 1)], idx = 0; destory[0][0] = K
var result = -1

while idx < queue.count {
    let (y, x, cnt) = queue[idx]; idx += 1
    if y == N-1 && x == M-1 { result = cnt; break }
    for (ny, nx) in [(y+1,x),(y-1,x),(y,x+1),(y,x-1)] {
        if !((0..<N) ~= ny && (0..<M) ~= nx) { continue }
        if destory[y][x] - graph[ny][nx] <= destory[ny][nx] { continue }
        queue.append((ny, nx, cnt+1))
        destory[ny][nx] = destory[y][x] - graph[ny][nx]
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
