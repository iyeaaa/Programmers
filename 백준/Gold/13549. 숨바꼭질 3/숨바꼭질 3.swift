let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])

print(n >= k ? n-k : bfs(start: n))

func bfs(start: Int) -> Int {
    var visit = [Int](repeating: -1, count: 100001)
    visit[start] = 0
    var queue = [start]
    var index = 0
    while index < queue.count {
        let cur = queue[index]
        if cur == k {
            return visit[cur]
        }

        if (0...100000).contains(cur*2) && visit[cur*2] == -1 {
            queue.append(cur*2)
            visit[cur*2] = visit[cur]
        }

        if (0...100000).contains(cur-1) && visit[cur-1] == -1 {
            queue.append(cur-1)
            visit[cur-1] = visit[cur] + 1
        }

        if (0...100000).contains(cur+1) && visit[cur+1] == -1 {
            queue.append(cur+1)
            visit[cur+1] = visit[cur] + 1
        }

        index += 1
    }
    return -1
}