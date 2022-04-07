let n = Int(readLine()!)!
var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
let dx = [0, -1, 0, 1]
let dy = [-1, 0, 1, 0]

for i in 0..<n {
    let temp = Array(readLine()!)
    for j in 0..<n {
        graph[i][j] = Int(String(temp[j]))!
    }
}

func bfs(_ x: Int,_ y: Int) -> Int {
    var count = 1
    var queue = [[x, y]]

    if graph[x][y] == 0 {
        return -1
    }

    graph[x][y] = 0

    while !queue.isEmpty {
        let temp = queue.removeFirst()
        for i in 0...3 {
            let nx = temp[0] + dx[i]
            let ny = temp[1] + dy[i]

            if nx < 0 || nx > n-1 || ny < 0 || ny > n-1 {
                continue
            }

            if graph[nx][ny] == 0 {
                continue
            }

            queue.append([nx, ny])
            graph[nx][ny] = 0
            count += 1
        }
    }

    return count
}

var result: [Int] = []
var count = 0

for i in 0..<n {
    for j in 0..<n {
        let temp = bfs(i, j)
        if temp != -1 {
            count += 1
            result.append(temp)
        }
    }
}

print(count)
result.sort()

for i in result {
    print(i)
}