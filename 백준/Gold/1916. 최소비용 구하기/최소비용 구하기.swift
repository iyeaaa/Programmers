import Foundation

final class IO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {

        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                      || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }

    @inline(__always) func writeByString(_ output: String) { // wapas
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

struct Heap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    var first: T? { isEmpty ? nil : heap[1] }

    var count: Int { isEmpty ? 0 : heap.count-1 }

    mutating func insert(_ h: T) {
        heap.append(h)
        if isEmpty { heap.append(h) }
        var isrt = heap.count-1
        while isrt > 1 && heap[isrt] < heap[isrt/2] {
            let prnt = isrt/2
            heap.swapAt(isrt, prnt)
            isrt = prnt
        }
    }

    enum Direction { case none, lf, ryt }
    mutating func pop() -> T? {
        func haveToDown(_ pop: Int) -> Direction {
            let lf = pop*2
            let ryt = lf+1
            if lf >= heap.count {
                return .none
            }
            if ryt >= heap.count {
                return heap[lf] < heap[pop] ? .lf : .none
            }
            if heap[lf] >= heap[pop] && heap[ryt] >= heap[pop] {
                return .none
            }
            if heap[lf] < heap[pop] && heap[ryt] < heap[pop] {
                return heap[lf] < heap[ryt] ? .lf : .ryt
            }
            return heap[lf] < heap[pop] ? .lf : .ryt
        }

        if isEmpty { return nil }
        heap.swapAt(1, heap.count-1)
        let returnData = heap.popLast()!

        var pop = 1
        while true {
            switch haveToDown(pop) {
            case .none:
                return returnData
            case .lf:
                let chl = pop*2
                heap.swapAt(pop, chl)
                pop = chl
            case .ryt:
                let chl = pop*2+1
                heap.swapAt(pop, chl)
                pop = chl
            }
        }
    }
}

struct Data: Comparable {
    var node: Int
    var cost: Int

    static func <(lhs: Data, rhs: Data) -> Bool {
        lhs.cost < rhs.cost
    }
}


let io = IO(), INF = 10000000000
typealias Edge = (to: Int, weight: Int)
let (N, M) = (io.readInt(), io.readInt())
let graph: [[Edge]] = crtGraph()
let (start, end) = (io.readInt(), io.readInt())
var dist = Array(repeating: INF, count: 100001); dist[start] = 0
var pq = Heap(Data(node: start, cost: 0))

while !pq.isEmpty {
    let cur = pq.pop()!
    if cur.cost > dist[cur.node] {
        continue
    }
    for (next, cost) in graph[cur.node] where cur.cost + cost < dist[next] {
        dist[next] = cur.cost + cost
        pq.insert(Data(node: next, cost: cur.cost+cost))
    }
}

print(dist[end])



func crtGraph() -> [[Edge]] {
    var graph = Array(repeating: [Edge](), count: N+1)
    for _ in 0..<M {
        graph[io.readInt()].append((io.readInt(), io.readInt()))
    }
    return graph
}

