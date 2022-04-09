let local = readLine()!.split{$0==" "}.map{Int(String($0))!}
var queue = [local[0]]
var count = [Int](repeating: 0, count: 100001)
count[local[0]] = 0
var visited = [Bool](repeating: false, count: 100001)
visited[local[0]] = true

print(bfs())

func bfs() -> Int {
    if local[0] == local[1] {
        return 0
    }

    var index = 0
    var second = 0
    while index < queue.count {
        let temp = queue[index]
        let n1 = temp - 1
        let n2 = temp + 1
        let n3 = temp * 2

        if n1 >= 0 && !visited[n1] {
            queue.append(n1)
            count[n1] = count[temp] + 1
            visited[n1] = true
            second = count[n1]
        }

        if n2 <= 100000 && !visited[n2] {
            queue.append(n2)
            count[n2] = count[temp] + 1
            visited[n2] = true
            second = count[n2]
        }

        if n3 <= 100000 && !visited[n3] {
            queue.append(n3)
            count[n3] = count[temp] + 1
            visited[n3] = true
            second = count[n3]
        }

        if n1 == local[1] || n2 == local[1] || n3 == local[1] {
            return second
        }

        index += 1
    }
    return -1
}