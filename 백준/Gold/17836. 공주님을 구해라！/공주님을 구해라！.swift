let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N ,M, T) = (input[0], input[1], input[2])
let graph: [[Int]] = crtGraph()

var visit = [[Int]](repeating: [Int](repeating: -1, count: M), count: N)
var queue = [(0, 0)], idx = 0; visit[0][0] = 0
var result = Int.max

while idx < queue.count {
    let (y, x) = queue[idx]; idx += 1
    if y == N-1 && x == M-1 { result = min(visit[N-1][M-1], result); break }
    if graph[y][x] == 2 { result = visit[y][x] + N-1-y + M-1-x }
    for (ny, nx) in [(y-1,x),(y+1,x),(y,x+1),(y,x-1)] {
        if !((0..<N) ~= ny && (0..<M) ~= nx) { continue }
        if visit[ny][nx] != -1 || graph[ny][nx] == 1 { continue }
        queue.append((ny, nx))
        visit[ny][nx] = visit[y][x] + 1
    }
}
print(result > T ? "Fail" : result)


func crtGraph() -> [[Int]] {
    var result = [[Int]]()
    for _ in 0..<N {
        result.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    return result
}

