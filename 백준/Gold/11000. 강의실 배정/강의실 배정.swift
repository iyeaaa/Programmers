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

    var count: Int { isEmpty ? 0 : heap.count-1 }

    var first: T? { isEmpty ? nil : heap[1] }

    mutating func insert(_ h: T) {
        func haveToUp(_ isrtIdx: Int) -> Bool {
            isrtIdx <= 1 ? false : heap[isrtIdx] < heap[isrtIdx/2]
        }
        if isEmpty { heap.append(h) }
        heap.append(h)

        var isrtIdx = heap.count-1
        while haveToUp(isrtIdx) {
            let prntIdx = isrtIdx/2
            heap.swapAt(isrtIdx, prntIdx)
            isrtIdx = prntIdx
        }
    }

    enum Direction { case lf, ryt, none }
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfIdx = popIdx*2
            let rytIdx = lfIdx+1
            if lfIdx >= heap.count {
                return .none
            }
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
                heap.swapAt(chlIdx, popIdx)
                popIdx = chlIdx
            case .ryt:
                let chlIdx = popIdx*2+1
                heap.swapAt(chlIdx, popIdx)
                popIdx = chlIdx
            }
        }
    }
}

struct Class: Comparable {
    static func <(lhs: Class, rhs: Class) -> Bool {
        lhs.T - lhs.S < rhs.T - lhs.S
    }
    var S: Int
    var T: Int
}


let io = IO()
let N = io.readInt()
var classes: [Class] = crtClasses()
var heap = Heap(classes[0])

for i in 1..<N {
    let cls = classes[i]
    if heap.first!.T <= cls.S {
        let _ = heap.pop()
    }
    heap.insert(cls)
}

print(heap.count)


func crtClasses() -> [Class] {
    var result = [Class]()
    for _ in 0..<N {
        result.append(Class(S: io.readInt(), T: io.readInt()))
    }
    return result.sorted{$0.S < $1.S}
}