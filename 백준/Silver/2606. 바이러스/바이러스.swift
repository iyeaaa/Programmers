let n = Int(readLine()!)!
let c = Int(readLine()!)!
var node = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)

for _ in 0..<c {
    let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
    node[temp[0]].append(temp[1])
    node[temp[1]].append(temp[0])
}

print(bfs())

func bfs() -> Int {
    visited[1] = true
    var queue = [1]
    var index = 0
    var n = 1
    while index < n {
        for i in node[queue[index]] {
            if !visited[i] {
                queue.append(i)
                n += 1
                visited[i] = true
            }
        }
        index += 1
    }
    return n-1
}