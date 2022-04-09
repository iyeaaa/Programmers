let local = readLine()!.split{$0==" "}.map{Int(String($0))!}
var queue = [local[0]]
var count = [Int](repeating: -1, count: 100001)
count[local[0]] = 0

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

        if n1 >= 0 && count[n1] == -1 {
            queue.append(n1)
            count[n1] = count[temp] + 1
            second = count[n1]
        }

        if n2 <= 100000 && count[n2] == -1 {
            queue.append(n2)
            count[n2] = count[temp] + 1
            second = count[n2]
        }

        if n3 <= 100000 && count[n3] == -1 {
            queue.append(n3)
            count[n3] = count[temp] + 1
            second = count[n3]
        }

        if n1 == local[1] || n2 == local[1] || n3 == local[1] {
            return second
        }

        index += 1
    }
    return -1
}