var input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let robot = Point(x: input[0], y: input[1], d: input[2])
var graph = [[Int]]()

for _ in 0..<n {
    graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

print(bfs())

struct Point {
    let x: Int
    let y: Int
    let d: Int
}


func bfs() -> Int {
    let (dx, dy) = ([-1, 0, 1, 0], [0, 1, 0, -1])
    var clean = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var queue = [robot]
    var index = 0
    var count = 1
    clean[robot.x][robot.y] = true
    while index < queue.count {
        let cur = queue[index]
        for i in 0...3 {
            let d = (cur.d+3-i)%4
            let (nx, ny, nd) = (cur.x+dx[d], cur.y+dy[d], d)
            if graph[nx][ny] == 0 && !clean[nx][ny] {
                queue.append(Point(x: nx, y: ny, d: nd))
                clean[nx][ny] = true
                count += 1
                break
            } else if i == 3 {
                let b = (cur.d+2) % 4
                if graph[cur.x+dx[b]][cur.y+dy[b]] == 1 {
                    return count
                } else {
                    queue.append(Point(x: cur.x+dx[b], y: cur.y+dy[b], d: cur.d))
                }
            }
        }
        index += 1
    }
    return -1
}
