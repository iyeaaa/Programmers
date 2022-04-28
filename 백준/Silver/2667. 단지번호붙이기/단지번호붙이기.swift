let n = Int(readLine()!)!
var node = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

mapConstructor()
printResult()

func mapConstructor() {
    for i in 0..<n {
        let temp = Array(readLine()!)
        for j in 0..<n {
            node[i][j] = Int(String(temp[j]))!
        }
    }
}

func printResult() {
    var result = [Int]()
    for i in 0..<n {
        for j in 0..<n {
            if node[i][j] == 1 {
                result.append(bfs(i, j))
            }
        }
    }
    var re = "\(result.count)\n"
    result.sort()
    for i in result {
        re += "\(i)\n"
    }
    print(re)
}

func bfs(_ x: Int, _ y: Int) -> Int {
    let dx = [-1, 0, 1, 0]
    let dy = [0, -1, 0, 1]
    node[x][y] = 0
    var index = 0
    var queue = [[x, y]]
    while index < queue.count {
        for i in 0...3 {
            let nx = queue[index][0] + dx[i]
            let ny = queue[index][1] + dy[i]
            if nx < 0 || nx > n-1 || ny < 0 || ny > n-1 || node[nx][ny] == 0 {
                continue
            } else {
                queue.append([nx, ny])
                node[nx][ny] = 0
            }
        }
        index += 1
    }
    return queue.count
}
