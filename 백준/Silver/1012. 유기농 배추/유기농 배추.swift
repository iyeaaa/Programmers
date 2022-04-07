var t = Int(readLine()!)!
let dx = [0, -1, 0, 1]
let dy = [-1, 0, 1, 0]

for _ in 0..<t {
    let imp = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var graph = [[Int]](repeating: [Int](repeating: 0, count: imp[0]), count: imp[1])
    var result = 0

    for _ in 0..<imp[2] {
        let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
        graph[temp[1]][temp[0]] = 1
    }

    for i in 0..<imp[1] {
        for j in 0..<imp[0] {
            if bfs(i, j) {
                result += 1
            }
        }
    }

    print(result)


    func bfs(_ x: Int,_ y: Int) -> Bool {
        var queue = [[x, y]]

        if graph[x][y] == 0 {
            return false
        }

        graph[x][y] = 0

        while !queue.isEmpty {
            let temp = queue.removeFirst()
            for i in 0...3 {
                let nx = temp[0] + dx[i]
                let ny = temp[1] + dy[i]

                if nx < 0 || nx > imp[1]-1 || ny < 0 || ny > imp[0]-1 {
                    continue
                }

                if graph[nx][ny] == 0 {
                    continue
                }

                queue.append([nx, ny])
                graph[nx][ny] = 0
            }   // for
        }   // while

        return true
    }   // bfs
}







