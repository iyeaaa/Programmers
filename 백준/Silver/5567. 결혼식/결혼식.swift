let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n+1)
var visit = [Int](repeating: -1, count: n+1)
var count = 0

for _ in 0..<m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

print(bfs())

func bfs() -> Int {
    if graph[1] == [] {
        return 0
    }
    visit[1] = 0
    var queue = [1]
    var index = 0
    var count = 0
    while index < queue.count {
        let cur = queue[index]
        if visit[cur] == 2 {
            index += 1
            continue
        }
        for i in graph[cur] {
            if visit[i] == -1 {
                visit[i] = visit[cur] + 1
                queue.append(i)
                count += 1
            }
        }
        index += 1
    }
    return count
}
