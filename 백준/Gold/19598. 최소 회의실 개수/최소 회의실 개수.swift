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

    init(){}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    var count: Int { isEmpty ? 0 : heap.count-1 }

    var first: T? { isEmpty ? nil : heap[1] }

    mutating func insert(_ h: T) {
        func haveToUp(_ isrtIdx: Int) -> Bool {
            isrtIdx <= 1 ? false : heap[isrtIdx] < heap[isrtIdx/2]
        }

        heap.append(h)
        if isEmpty { heap.append(h) }
        var isrtIdx = heap.count-1
        while haveToUp(isrtIdx) {
            let prntIdx = isrtIdx/2
            heap.swapAt(isrtIdx, prntIdx)
            isrtIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lf = popIdx*2
            let ryt = lf+1
            if lf >= heap.count { return .none }
            if ryt >= heap.count {
                return heap[lf] < heap[popIdx] ? .lf : .none
            }
            if heap[lf] >= heap[popIdx] && heap[ryt] >= heap[popIdx] {
                return .none
            }
            if heap[lf] < heap[popIdx] && heap[ryt] < heap[popIdx] {
                return heap[lf] < heap[ryt] ? .lf : .ryt
            }
            return heap[lf] < heap[ryt] ? .lf : .ryt
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
                let chl = popIdx*2
                heap.swapAt(chl, popIdx)
                popIdx = chl
            case .ryt:
                let chl = popIdx*2+1
                heap.swapAt(chl, popIdx)
                popIdx = chl
            }
        }
    }
}

struct Meet: Comparable {
    static func <(lhs: Meet, rhs: Meet) -> Bool {
        lhs.E < rhs.E
    }

    var S: Int
    var E: Int
}

let io = IO()
let N = io.readInt()
let meets = crtMeets()
var heap = Heap(meets[0])

for i in 1..<N {
    if heap.first!.E <= meets[i].S {
        let _ = heap.pop()
    }
    heap.insert(meets[i])
}

print(heap.count)


func crtMeets() -> [Meet] {
    var result = [Meet]()
    for _ in 0..<N {
        result.append(Meet(S: io.readInt(), E: io.readInt()))
    }
    return result.sorted{$0.S < $1.S}
}
