let nmv = readLine()!.split{$0==" "}.map{Int(String($0))!}
var point = [[Int]](repeating: [], count: nmv[0]+1)
var dfs_visit = [Bool](repeating: false, count: nmv[0]+1)
var bfs_visit = [Bool](repeating: false, count: nmv[0]+1)
var dfs_result = ""
var bfs_result = ""

for _ in 0..<nmv[1] {
    let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
    point[temp[0]].append(temp[1])
    point[temp[1]].append(temp[0])
}

for i in 1...nmv[0] {
    point[i].sort()
}

dfs(nmv[2])
bfs(nmv[2])

print(dfs_result)
print(bfs_result)

func dfs(_ start: Int) {
    if dfs_visit[start] {
        return
    }
    dfs_visit[start] = true
    dfs_result += "\(start) "
    for i in 0..<point[start].count {
        dfs(point[start][i])
    }
}

func bfs(_ start: Int) {
    bfs_result += "\(start) "
    bfs_visit[start] = true
    var queue = [start]
    var index = 0
    var n = 1
    while index < n {
        for i in point[queue[index]] {
            if !bfs_visit[i] {
                queue.append(i)
                bfs_visit[i] = true
                n += 1
                bfs_result += "\(i) "
            }
        }
        index += 1
    }
}
