import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    @discardableResult
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                      || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                      || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                      && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

struct MaxHeap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    mutating func insert(_ h: T) {
        func haveToUp(_ insertIdx: Int) -> Bool {
            if insertIdx <= 1 { return false }
            return heap[insertIdx] > heap[insertIdx/2]
        }

        heap.append(h);
        if heap.count == 1 { heap.append(h); return }

        var insertIdx = heap.count-1
        while haveToUp(insertIdx) {
            let prntIdx = insertIdx / 2
            heap.swapAt(insertIdx, prntIdx)
            insertIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    @discardableResult
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfChlIdx = popIdx*2
            let rytChlIdx = lfChlIdx+1
            if lfChlIdx >= heap.count { return .none }
            if rytChlIdx >= heap.count {
                return heap[lfChlIdx] > heap[popIdx] ? .lf : .none
            }
            if heap[lfChlIdx] <= heap[popIdx] && heap[rytChlIdx] <= heap[popIdx] {
                return .none
            }
            if heap[lfChlIdx] > heap[popIdx] && heap[rytChlIdx] > heap[popIdx] {
                return heap[lfChlIdx] > heap[rytChlIdx] ? .lf : .ryt
            }
            return heap[lfChlIdx] > heap[popIdx] ? .lf : .ryt
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
                let chlIdx = popIdx*2 + 1
                heap.swapAt(chlIdx, popIdx)
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

    mutating func insert(_ h: T) {
        func haveToUp(_ insertIdx: Int) -> Bool {
            if insertIdx <= 1 { return false }
            return heap[insertIdx] < heap[insertIdx/2]
        }

        heap.append(h);
        if heap.count == 1 { heap.append(h); return }

        var insertIdx = heap.count-1
        while haveToUp(insertIdx) {
            let prntIdx = insertIdx / 2
            heap.swapAt(insertIdx, prntIdx)
            insertIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    @discardableResult
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfChlIdx = popIdx*2
            let rytChlIdx = lfChlIdx+1
            if lfChlIdx >= heap.count { return .none }
            if rytChlIdx >= heap.count {
                return heap[lfChlIdx] < heap[popIdx] ? .lf : .none
            }
            if heap[lfChlIdx] >= heap[popIdx] && heap[rytChlIdx] >= heap[popIdx] {
                return .none
            }
            if heap[lfChlIdx] < heap[popIdx] && heap[rytChlIdx] < heap[popIdx] {
                return heap[lfChlIdx] < heap[rytChlIdx] ? .lf : .ryt
            }
            return heap[lfChlIdx] < heap[popIdx] ? .lf : .ryt
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
                let chlIdx = popIdx*2 + 1
                heap.swapAt(chlIdx, popIdx)
                popIdx = chlIdx
            }
        }
    }
}

let file = FileIO()

for _ in 0..<file.readInt() {
    var maxHeap = MaxHeap<Int>()
    var minHeap = MinHeap<Int>()
    var popped = [Int: Int]()
    var count = 0

    for _ in 0..<file.readInt() {
        if file.readString() == "I" {
            let x = file.readInt()
            maxHeap.insert(x)
            minHeap.insert(x)
            popped[x, default: 0] += 1
        } else {
            file.readInt() == 1 ? maxPop() : minPop()
        }
    }

    func maxPop() {
        while let p = maxHeap.pop() {
            if popped[p]! > 0 { popped[p]! -= 1 ; break }
        }
    }

    func minPop() {
        while let p = minHeap.pop() {
            if popped[p]! > 0 { popped[p]! -= 1; break }
        }
    }

    var maxValue = Int.max
    while let p = maxHeap.pop() {
        if popped[p]! > 0 { maxValue = p; break }
    }
    var minValue = Int.max
    while let p = minHeap.pop() {
        if popped[p]! > 0 { minValue = p; break }
    }
    if maxValue == Int.max || minValue == Int.max {
        print("EMPTY")
    } else {
        print(maxValue, minValue)
    }
}