var Case = Int(readLine()!)!

while Case > 0 {
    let n = Int(readLine()!)!
    let house = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var conv = [[Int]](repeating: [], count: n)
    for i in 0..<n {
        conv[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
    }
    conv.sort {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        } else {
            return $0[0] < $1[0]
        }
    }
    let rock = readLine()!.split{$0==" "}.map{Int(String($0))!}
    print(bfs(start: house, end: rock, conv: conv))
    Case -= 1
}

func bfs(start: [Int], end: [Int], conv: [[Int]]) -> String {
    if abs(end[0]-start[0]) + abs(end[1]-start[1]) <= 1000 {
        return "happy"
    }
    var index = 0
    var queue = [start]
    var visit = [Bool](repeating: false, count: conv.count)
    while index < queue.count {
        let cur = queue[index]
        for i in 0..<conv.count {
            if abs(conv[i][0] - cur[0]) + abs(conv[i][1] - cur[1]) <= 1000
                       && !visit[i] {
                if abs(conv[i][0] - end[0]) + abs(conv[i][1] - end[1]) <= 1000 {
                    return "happy"
                } else {
                    queue.append(conv[i])
                    visit[i] = true
                }
            }
        }
        index += 1
    }
    return "sad"
}