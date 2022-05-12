let n = Int(readLine()!)!
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (x, y) = (input[0], input[1])
let relate_ea = Int(readLine()!)!
var node = [[Int]](repeating: [], count: 101)
var visit = [Int](repeating: 0, count: 101)

for _ in 0..<relate_ea {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    node[input[0]].append(input[1])
    node[input[1]].append(input[0])
}

print(bfs(start: x, target: y))

func bfs(start: Int, target: Int) -> Int {
    var index = 0
    visit[start] = 0
    var queue = [start]
    while index < queue.count {
        let cur = queue[index]
        for i in node[cur] {
            if visit[i] == 0 {
                queue.append(i)
                visit[i] = visit[cur] + 1
                if i == target {
                    return visit[i]
                }
            }
        }
        index += 1
    }
    return -1
}