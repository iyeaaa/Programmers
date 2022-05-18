class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    init(_ queue: [T]) {
        enqueue = queue
    }
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    func push(_ n: T) {
        enqueue.append(n)
    }
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m, k, x) = (input[0], input[1], input[2], input[3])
var graph = [[Int]](repeating: [], count: n+1)
var visit = [Int](repeating: -1, count: n+1)

for _ in 1...m {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[input[0]].append(input[1])
}

print(bfs().map{String($0)}.joined(separator: "\n"))

func bfs() -> [Int] {
    var queue = Queue<Int>([x])
    var result = [Int]()
    visit[x] = 0
    while !queue.isEmpty {
        let cur = queue.pop()!
        for i in graph[cur] {
            if visit[i] == -1 {
                queue.push(i)
                visit[i] = visit[cur] + 1
                if visit[i] == k {
                    result.append(i)
                }
            }
        }
    }
    if result.isEmpty {
        result.append(-1)
    }
    return result.sorted()
}









