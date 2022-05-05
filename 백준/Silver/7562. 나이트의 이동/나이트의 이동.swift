let n = Int(readLine()!)!
var result = ""

struct Point {
    let x: Int
    let y: Int
}

for _ in 0..<n {
    let i = Int(readLine()!)!
    var graph = [[Int]](repeating: [Int](repeating: 0, count: i), count: i)
    result += "\(bfs())\n"

    func bfs() -> Int {
        let start = readLine()!.split{$0==" "}.map{Int(String($0))!}
        let end = readLine()!.split{$0==" "}.map{Int(String($0))!}
        var queue = [Point(x: start[0], y: start[1])]
        var index = 0
        while index < queue.count {
            let cur = queue[index]
            if cur.x == end[0] && cur.y == end[1] {
                return graph[cur.x][cur.y]
            }
            for d in [[-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, -2], [2, -1], [2, 1], [1, 2]] {
                let (nx, ny) = (cur.x + d[0], cur.y + d[1])
                if !(0..<i).contains(nx) || !(0..<i).contains(ny) {
                    continue
                }
                if graph[nx][ny] != 0 {
                    continue
                }
                queue.append(Point(x: nx, y: ny))
                graph[nx][ny] = graph[cur.x][cur.y] + 1
            }
            index += 1
        }
        return -1
    }
}

print(result)