let node = Int(readLine()!)!
let line = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: node+1)
var infect = [Bool](repeating: false, count: node+1)

for _ in 0..<line {
    let temp = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[temp[0]].append(temp[1])
    graph[temp[1]].append(temp[0])
}

func bfs(_ start: Int) -> Int{
    var queue: [Int] = [start]
    infect[start] = true
    var result = 0

    while !queue.isEmpty {
        let temp = queue.removeFirst()

        for i in graph[temp] {
            if !infect[i] {
                queue.append(i)
                infect[i] = true
                result += 1
            }
        }
    }

    return result
}

print(bfs(1))