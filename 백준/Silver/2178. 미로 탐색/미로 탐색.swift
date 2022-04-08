let size = readLine()!.split{$0==" "}.map{Int(String($0))!}
var graph = [[Int]](repeating: [Int](repeating: 0, count: size[1]), count: size[0])
let dx = [0, -1, 0, 1]
let dy = [-1, 0, 1, 0]

for i in 0..<size[0] {
    let temp = Array(readLine()!)
    for j in 0..<size[1] {
        graph[i][j] = Int(String(temp[j]))!
    }
}

print(bfs(0, 0))


func bfs(_ x: Int, _ y: Int) -> Int {
    var queue = [[x, y]]
    while !queue.isEmpty {
        let temp = queue.removeFirst()
        for i in 0...3 {
            let nx = temp[0] + dx[i]
            let ny = temp[1] + dy[i]

            if (nx < 0 || nx > size[0]-1 || ny < 0 || ny > size[1]-1) || graph[nx][ny] != 1 {
                continue
            }

            queue.append([nx, ny])
            graph[nx][ny] = graph[nx-dx[i]][ny-dy[i]] + 1

            if nx == size[0]-1 && ny == size[1]-1 {
                return graph[nx][ny]
            }
        }
    }
    return -1
}