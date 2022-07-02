import Foundation

struct Heap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ n: T) { heap.append(n); heap.append(n) }

    var isEmpty: Bool { heap.count <= 1 }

    mutating func insert(_ h: T) {
        func haveToMoveUp(_ insertIdx: Int) -> Bool {
            if insertIdx <= 1 { return false }
            return heap[insertIdx] > heap[insertIdx/2]
        }

        heap.append(h)
        if heap.count == 1 { heap.append(h); return }

        var insertIdx = heap.count - 1
        while haveToMoveUp(insertIdx) {
            let parentIdx = insertIdx / 2
            heap.swapAt(insertIdx, parentIdx)
            insertIdx = parentIdx
        }
    }

    enum Direction { case none, lf, ryt }
    mutating func pop() -> T? {
        func haveToMoveDown(_ popIdx: Int) -> Direction {
            let lfChlIdx = popIdx * 2
            let rytChlIdx = lfChlIdx + 1
            if lfChlIdx >= heap.count { return .none }
            if rytChlIdx >= heap.count {
                return heap[lfChlIdx] < heap[popIdx] ? .lf : .none
            }
            if heap[lfChlIdx] <= heap[popIdx] && heap[rytChlIdx] <= heap[popIdx] {
                return .none
            }
            if heap[lfChlIdx] > heap[popIdx] && heap[rytChlIdx] > heap[popIdx] {
                return heap[lfChlIdx] > heap[rytChlIdx] ? .lf : .ryt
            }
            return heap[lfChlIdx] > heap[popIdx] ? .lf : .ryt
        }

        heap.swapAt(1, heap.count-1)
        let returnData = heap.popLast()!

        var popIdx = 1
        while true {
            switch haveToMoveDown(popIdx) {
            case .none:
                return returnData
            case .lf:
                let chlIdx = popIdx*2
                heap.swapAt(chlIdx, popIdx)
                popIdx = chlIdx
            case .ryt:
                let chlIdx = popIdx*2 + 1
                heap.swapAt(chlIdx, popIdx)
                popIdx = chlIdx
            }
        }
    }
}

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)
@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

var heap = Heap<Int>()

let n = readInt()
for _ in 0..<n*n {
    heap.insert(readInt())
}

for _ in 1..<n {
    let _ = heap.pop()
}

print(heap.pop()!)