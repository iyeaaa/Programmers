let n = Int(readLine()!)!
var node = [[Int]](repeating: [], count: n+1)
var parent = [Int](repeating: 0, count: n+1) // 0 -> 방문x
var result = ""

for _ in 1..<n {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    node[input[0]].append(input[1])
    node[input[1]].append(input[0])
}

bfs()
for i in 2...n {
    result += "\(parent[i])\n"
}

print(result)

func bfs() {
    var index = 0
    var queue = [1]
    parent[1] = -1
    while index < queue.count {
        let cur = queue[index]
        for i in node[cur] {
            if parent[i] == 0 {
                queue.append(i)
                parent[i] = cur
            }
        }
        index += 1
    }
}





