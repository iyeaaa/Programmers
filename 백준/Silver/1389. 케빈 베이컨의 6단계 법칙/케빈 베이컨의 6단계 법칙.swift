let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[Int]](repeating: [], count: n+1)

for _ in 1...m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var min = Int.max
var minindex = 0
for i in 1...n {
    let d = bfs(i)
    if min > d {
        min = d
        minindex = i
    }
}

print(minindex)

func bfs(_ s: Int) -> Int {
    var index = 0
    var queue = [s]
    var visit = [Int](repeating: -1, count: n+1)
    visit[s] = 0
    var count = 0
    while index < queue.count {
        let cur = queue[index]
        for i in graph[cur] {
            if visit[i] == -1 {
                queue.append(i)
                visit[i] = visit[cur] + 1
                count += visit[i]
            }
        }
        index += 1
    }
    return count
}
