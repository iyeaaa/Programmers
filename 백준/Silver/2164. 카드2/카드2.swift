struct Queue {
    var queue = [Int]()
    var index = 0

    init() {}
    init(_ q: [Int]) { queue = q }

    var count: Int { queue.count - index }

    var first: Int { queue[index] }

    mutating func append(_ q: Int) {
        queue.append(q)
    }

    mutating func pop() -> Int {
        defer { index += 1 }
        return queue[index]
    }
}

let N = Int(readLine()!)!
var queue = Queue(Array(1...N))

while queue.count > 1 {
    _ = queue.pop()
    queue.append(queue.pop())
}

print(queue.first)