struct Queue<T> {
    var enqueue = [T]()
    var dequeue = [T]()

    init(_ q: [T]) { enqueue = q }

    var isEmpty: Bool {
        enqueue.isEmpty && dequeue.isEmpty
    }

    var count: Int {
        enqueue.count + dequeue.count
    }

    mutating func append(_ q: T) {
        enqueue.append(q)
    }

    mutating func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}


let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])

var isVisit = [Int](repeating: -1, count: 100001)
var queue = Queue<Int>([N]); isVisit[N] = N

while !queue.isEmpty {
    let cur = queue.pop()!
    if cur == K {
        break
    }
    for next in [cur-1, cur+1, cur*2] where (0...100000) ~= next && isVisit[next] == -1 {
        queue.append(next)
        isVisit[next] = cur
    }
}

var result = [K]
var idx = K
while idx != N {
    result.append(isVisit[idx])
    idx = isVisit[idx]
}
result = result.reversed()
print(result.count-1, result.map{String($0)}.joined(separator: " "), separator: "\n")