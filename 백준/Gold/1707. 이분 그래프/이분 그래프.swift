let Case = Int(readLine()!)!
let (RED, BLUE, NON) = (-1, 1, 0)

first: for _ in 0..<Case {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (v, e) = (input[0], input[1])
    var graph = [[Int]](repeating: [], count: v+1)
    var visit = [Int](repeating: 0, count: 20001)

    for _ in 0..<e {
        let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
        graph[temp[0]].append(temp[1])
        graph[temp[1]].append(temp[0])
    }

    for i in 1...v {
        if visit[i] == 0 {
            if bfs(start: i) == "NO" {
                print("NO")
                continue first
            }
        }
    }

    print("YES")

    func bfs(start: Int) -> String {
        var queue = [start]
        var index = 0
        visit[start] = RED
        while index < queue.count {
            let cur = queue[index]
            for i in graph[cur] {
                if visit[i] == NON {
                    if visit[cur] == RED {
                        visit[i] = BLUE
                    } else {
                        visit[i] = RED
                    }
                    queue.append(i)
                } else if visit[i] == BLUE {
                    if visit[cur] == BLUE {
                        return "NO"
                    }
                } else {    // visit[i] == RED
                    if visit[cur] == RED {
                        return "NO"
                    }
                }
            }
            index += 1
        }
        return "YES"
    }
}