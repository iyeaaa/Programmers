let n = Int(readLine()!)!
var graph = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
var result = ""

for i in 1...n {
    graph[i] = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}
}

for i in 1...n {
    for j in 1...n {
        result += "\(bfs(i, j)) "
    }
    result += "\n"
}

print(result)

func bfs(_ x: Int, _ y: Int) -> Int {
    var visit = [Bool](repeating: false, count: n+1)
    var queue = [x]
    var index = 0
    while index < queue.count {
        for i in 1...n {
            if !visit[i] && graph[queue[index]][i] == 1 {
                if i == y {
                    return 1
                }
                queue.append(i)
                visit[i] = true
            }
        }
        index += 1
    }
    return 0
}
