let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (a, b) = (input[0], input[1])
var counting = [Int:Int]()

print(bfs(start: a, target: b))

func bfs(start: Int, target: Int) -> Int {
    var index = 0
    var queue = [start]
    counting[start] = 1
    while index < queue.count {
        let cur = queue[index]
        for i in [cur*2, Int(String(cur)+"1")!] {
            if i <= 1_000_000_000 {
                if i == target {
                    return counting[cur]! + 1
                } else {
                    queue.append(i)
                    counting[i] = counting[cur]! + 1
                }
            }
        }
        index += 1
    }
    return -1
}