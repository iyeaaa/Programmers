let list = readLine()!.split{$0==" "}.map{Int(String($0))!}
var node = [[Int]](repeating: [], count: list[0]+1)
var dfs_visited = [Bool](repeating: false, count: list[0]+1)
var bfs_visited = [Bool](repeating: false, count: list[0]+1)
var dfs_result = ""
var bfs_result = ""

for _ in 1...list[1] {
    let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
    node[temp[0]].append(temp[1])
    node[temp[1]].append(temp[0])
}

for i in 1...list[0] {
    node[i].sort(by: <)
}


func dfs(_ start: Int) {
    dfs_visited[start] = true
    dfs_result += "\(start) "
    
    for i in node[start] {
        if !dfs_visited[i] {
            dfs(i)
        }
    }
}


func bfs(_ start: Int) {
    var queue: [Int] = [start]
    bfs_visited[start] = true
    bfs_result += "\(start) "
    
    while !queue.isEmpty {
        let temp = queue.removeFirst()
        for i in node[temp] {
            if !bfs_visited[i] {
                queue.append(i)
                bfs_result += "\(i) "
                bfs_visited[i] = true
            }
        }
    }
}

dfs(list[2])
bfs(list[2])
print(dfs_result)
print(bfs_result)
