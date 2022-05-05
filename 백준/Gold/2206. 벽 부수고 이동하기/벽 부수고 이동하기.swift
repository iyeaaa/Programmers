let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]]()

struct Element {
    let x: Int
    let y: Int
    let wall: Int
}

for i in 0..<n {
    graph.append(Array(readLine()!).map{Int(String($0))!})
}

print(bfs())

func bfs() -> Int {
    var visited = Array(repeating: Array(repeating: [0, 0], count: m), count: n)
    visited[0][0][0] = 1
    var queue = [Element(x: 0, y: 0, wall: 0)]
    var index = 0
    while index < queue.count {
        let cur = queue[index]
        if cur.x == n-1 && cur.y == m-1 {
            return visited[cur.x][cur.y][cur.wall]
        }
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
            let (nx, ny) = (cur.x + i[0], cur.y + i[1])
            if !(0..<n).contains(nx) || !(0..<m).contains(ny) {
                continue
            }
            if graph[nx][ny] == 1 && cur.wall == 0 {
                visited[nx][ny][1] = visited[cur.x][cur.y][cur.wall] + 1
                queue.append(Element(x: nx, y: ny, wall: 1))
            }
            if graph[nx][ny] == 0 && visited[nx][ny][cur.wall] == 0 {
                visited[nx][ny][cur.wall] = visited[cur.x][cur.y][cur.wall] + 1
                queue.append(Element(x: nx, y: ny, wall: cur.wall))
            }
        }
        index += 1
    }
    return -1
}

