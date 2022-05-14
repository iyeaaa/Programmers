let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (F, S, G, U, D) = (input[0], input[1], input[2], input[3], input[4])

let result = bfs(start: S, target: G, top: F, u: U, d: D)
print( result == -1 ? "use the stairs" : result )

func bfs(start: Int, target: Int, top: Int, u: Int, d: Int) -> Int {
    if start == target {
        return 0
    }
    var index = 0
    var queue = [start]
    var visit = [Int:Int]()
    visit[start] = 0
    while index < queue.count {
        let cur = queue[index]
        for i in [cur+u, cur-d] {
            if i >= 1 && i <= top && visit[i] == nil {
                queue.append(i)
                visit[i] = visit[cur]! + 1
                if i == target {
                    return visit[i]!
                }
            }
        }
        index += 1
    }
    return -1
}