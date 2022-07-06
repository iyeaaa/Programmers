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
}

struct Heap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    var first: T? { isEmpty ? nil : heap[1] }

    mutating func insert(_ h: T) {
        func haveToUp(_ isrtIdx: Int) -> Bool {
            isrtIdx <= 1 ? false : heap[isrtIdx] < heap[isrtIdx/2]
        }
        heap.append(h)
        if isEmpty { heap.append(h); return }

        var isrtIdx = heap.count - 1
        while haveToUp(isrtIdx) {
            let prntIdx = isrtIdx / 2
            heap.swapAt(isrtIdx, prntIdx)
            isrtIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfIdx = popIdx * 2
            let rytIdx = popIdx * 2 + 1
            if lfIdx >= heap.count { return .none }
            if rytIdx >= heap.count {
                return heap[lfIdx] < heap[popIdx] ? .lf : .none
            }
            if heap[lfIdx] >= heap[popIdx] && heap[rytIdx] >= heap[popIdx] {
                return .none
            }
            if heap[lfIdx] < heap[popIdx] && heap[rytIdx] < heap[popIdx] {
                return heap[lfIdx] < heap[rytIdx] ? .lf : .ryt
            }
            return heap[lfIdx] < heap[popIdx] ? .lf : .ryt
        }

        if isEmpty { return nil }
        heap.swapAt(1, heap.count-1)
        let returnData = heap.popLast()!

        var popIdx = 1
        while true {
            switch haveToDown(popIdx) {
            case .none:
                return returnData
            case .lf:
                let chlIdx = popIdx*2
                heap.swapAt(popIdx, chlIdx)
                popIdx = chlIdx
            case .ryt:
                let chlIdx = popIdx*2 + 1
                heap.swapAt(popIdx, chlIdx)
                popIdx = chlIdx
            }
        }
    }
}

struct Node: Comparable {
    var no: Int
    var dist: Int

    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.dist < rhs.dist
    }
}

var io = IO()
let INF = Int.max
let (v, e) = (io.readInt(), io.readInt())
let k = io.readInt()-1

var graph: Array<[(Int, Int)]> = Array(repeating: [(Int, Int)](), count: v)
for _ in 0..<e {
    graph[io.readInt()-1].append((io.readInt()-1, io.readInt()))
}

var distance = Array(repeating: INF, count: v); distance[k] = 0

var pq = Heap<Node>()
pq.insert(Node(no: k, dist: 0))
while !pq.isEmpty {
    let now = pq.pop()!
    if distance[now.no] < now.dist {
        continue
    }
    for next in graph[now.no] {
        if now.dist + next.1 < distance[next.0] {
            distance[next.0] = now.dist + next.1
            pq.insert(Node(no: next.0, dist: distance[next.0]))
        }
    }
}

var result = ""
for i in distance {
    result += (i == INF ? "INF\n" : "\(i)\n")
}
print(result)