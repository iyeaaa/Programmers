let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var node = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)
var result = 0

for _ in 0..<m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    node[input[0]].append(input[1])
    node[input[1]].append(input[0])
}

for i in 1...n {
    if !visited[i] {
        bfs(start: i)
        result += 1
    }
}

print(result)

func bfs(start: Int) {
    visited[start] = true
    var index = 0
    var queue = [start]
    while index < queue.count {
        let c = queue[index]
        for i in 0..<node[c].count {
            if !visited[node[c][i]] {
                queue.append(node[c][i])
                visited[node[c][i]] = true
            }
        }
        index += 1
    }
}