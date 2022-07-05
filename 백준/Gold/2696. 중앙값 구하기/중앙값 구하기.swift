import Foundation

struct MaxHeap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    var first: T? { isEmpty ? nil : heap[1] }

    var count: Int { heap.count == 0 ? 0 : heap.count - 1 }

    mutating func insert(_ h: T) {
        func haveToUp(isrtIdx: Int) -> Bool {
            isrtIdx <= 1 ? false : heap[isrtIdx] > heap[isrtIdx/2]
        }
        heap.append(h)
        if isEmpty { heap.append(h); return }

        var isrtIdx = heap.count-1
        while haveToUp(isrtIdx: isrtIdx) {
            let prntIdx = isrtIdx/2
            heap.swapAt(isrtIdx, prntIdx)
            isrtIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfIdx = popIdx * 2
            let rytIdx = lfIdx + 1
            if lfIdx >= heap.count { return .none }
            if rytIdx >= heap.count {
                return heap[lfIdx] > heap[popIdx] ? .lf : .none
            }
            if heap[lfIdx] <= heap[popIdx] && heap[rytIdx] <= heap[popIdx] {
                return .none
            }
            if heap[lfIdx] > heap[popIdx] && heap[rytIdx] > heap[popIdx] {
                return heap[lfIdx] > heap[rytIdx] ? .lf : .ryt
            }
            return heap[lfIdx] > heap[popIdx] ? .lf : .ryt
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

struct MinHeap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    var first: T? { isEmpty ? nil : heap[1] }

    var count: Int { heap.count == 0 ? 0 : heap.count - 1 }

    mutating func insert(_ h: T) {
        func haveToUp(isrtIdx: Int) -> Bool {
            isrtIdx <= 1 ? false : heap[isrtIdx] < heap[isrtIdx/2]
        }
        heap.append(h)
        if isEmpty { heap.append(h); return }

        var isrtIdx = heap.count-1
        while haveToUp(isrtIdx: isrtIdx) {
            let prntIdx = isrtIdx/2
            heap.swapAt(isrtIdx, prntIdx)
            isrtIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfIdx = popIdx * 2
            let rytIdx = lfIdx + 1
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

class IO {
    var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0;

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
}

let io = IO()
var result = ""

for _ in 0..<io.readInt() {
    let n = io.readInt()
    let first = io.readInt()
    result += "\((n+1)/2)\n\(first) "
    var isOdd = false
    var maxHeap = MaxHeap<Int>(first)
    var minHeap = MinHeap<Int>()
    var count = 1

    for _ in 1..<n {
        if count >= 10 { result += "\n"; count = 0 }
        let x = io.readInt()
        if isOdd {
            if x > minHeap.first! {
                minHeap.insert(x)
                maxHeap.insert(minHeap.pop()!)
            } else {
                maxHeap.insert(x)
            }
            result += "\(maxHeap.first!) "
            count += 1
        } else {
            if x >= maxHeap.first! {
                minHeap.insert(x)
            } else {
                minHeap.insert(maxHeap.pop()!)
                maxHeap.insert(x)
            }
        }
        isOdd.toggle()
    }
    result += "\n"
}

print(result)