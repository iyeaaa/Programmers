class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    init(_ queue: [T]) {
        enqueue = queue
    }
    var isEmpty: Bool {
        enqueue.isEmpty && dequeue.isEmpty
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
let (n, m) = (input[0], input[1])
var graph = [[Int]]()

for _ in 0..<n {
    graph.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

var max = 0
var count = 0
for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 1 {
            count += 1
            let temp = bfs(i, j)
            if max < temp {
                max = temp
            }
        }
    }
}

print(count)
print(max)

func bfs(_ i: Int, _ j: Int) -> Int {
    var count = 1
    graph[i][j] = 0
    let queue = Queue<[Int]>([[i, j]])
    while !queue.isEmpty {
        let cur = queue.pop()!
        let (x, y) = (cur[0], cur[1])
        for i in [[-1, 0], [0, -1], [1, 0], [0, 1]] {
            let (nx, ny) = (x+i[0], y+i[1])
            if (0..<n).contains(nx) && (0..<m).contains(ny)
                       && graph[nx][ny] == 1 {
                graph[nx][ny] = 0
                queue.push([nx, ny])
                count += 1
            }
        }
    }
    return count
}