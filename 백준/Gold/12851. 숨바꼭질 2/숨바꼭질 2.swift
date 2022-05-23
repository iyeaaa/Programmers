let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var visit = Array(repeating: -1, count: 100001)

print(n >= k ? "\(n-k)\n1" : bfs(start: n))

func bfs(start: Int) -> String {
    visit[start] = 0
    var index = 0
    var queue = [start]
    var count = 0
    var min = 0
    while index < queue.count {
        let cur = queue[index]
        if cur == k {
            min = visit[cur]
            count += 1
        }
        for i in [cur-1, cur+1, cur*2] {
            let next = i
            if (0...100000).contains(next) {
                if visit[next] == -1 || visit[cur] + 1 <= visit[next] {
                    queue.append(next)
                    visit[next] = visit[cur] + 1
                }
            }
        }
        index += 1
    }
    return "\(min)\n\(count)"
}