let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m, r) = (input[0], input[1], input[2])
var graph = Array(repeating: [Int](), count: n+1)
var list = Array(repeating: 0, count: n+1)
var count = 1
var result = ""

for _ in 0..<m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

for i in 1...n {
    graph[i].sort() {$1 < $0}
}

bfs(x: r)

for i in 1...n {
    result += "\(list[i])\n"
}

print(result)

func bfs(x: Int) {
    list[x] = count
    count += 1
    var queue = [x]
    var index = 0
    while index < queue.count {
        let cur = queue[index]
        for i in graph[cur] {
            if list[i] == 0 {
                queue.append(i)
                list[i] = count
                count += 1
            }
        }
        index += 1
    }
}