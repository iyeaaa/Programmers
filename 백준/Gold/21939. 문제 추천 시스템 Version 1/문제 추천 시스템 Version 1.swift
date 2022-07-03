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
        return buffer[index]
    }
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                      || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while 48...57 ~= now {
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

struct Problem: Comparable {
    let p: Int
    let l: Int

    static func < (lf: Problem, ryt: Problem) -> Bool {
        lf.l == ryt.l ? lf.p < ryt.p : lf.l < ryt.l
    }
}

struct MaxHeap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    var first: T? {
        if isEmpty { return nil };
        return heap[1]
    }

    mutating func insert(_ h: T) {
        func haveToUp(_ istIdx: Int) -> Bool {
            if istIdx <= 1 { return false }
            return heap[istIdx] > heap[istIdx/2]
        }

        heap.append(h)
        if heap.count == 1 { heap.append(h); return }

        var istIdx = heap.count - 1
        while haveToUp(istIdx) {
            let prntIdx = istIdx / 2
            heap.swapAt(istIdx, prntIdx)
            istIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    @discardableResult
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfChlIdx = popIdx*2
            let rytChlIdx = lfChlIdx + 1
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

    var first: T? {
        if isEmpty { return nil };
        return heap[1]
    }

    mutating func insert(_ h: T) {
        func haveToUp(_ istIdx: Int) -> Bool {
            if istIdx <= 1 { return false }
            return heap[istIdx] < heap[istIdx/2]
        }

        heap.append(h)
        if heap.count == 1 { heap.append(h); return }

        var istIdx = heap.count - 1
        while haveToUp(istIdx) {
            let prntIdx = istIdx / 2
            heap.swapAt(istIdx, prntIdx)
            istIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    @discardableResult
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfChlIdx = popIdx*2
            let rytChlIdx = lfChlIdx + 1
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
var level = [Int: Int]()
var maxHeap = MaxHeap<Problem>()
var minHeap = MinHeap<Problem>()

func inputProblem() {
    let (p, l) = (file.readInt(), file.readInt())
    level[p] = l
    maxHeap.insert(Problem(p: p, l: l))
    minHeap.insert(Problem(p: p, l: l))
}

for _ in 0..<file.readInt() {
    inputProblem()
}

var result = ""
for _ in 0..<file.readInt() {
    let command = file.readString()
    if command == "recommend" {
        if file.readInt() == 1 {
            while maxHeap.first!.l != level[maxHeap.first!.p] {
                maxHeap.pop()
            }
            result += "\(maxHeap.first!.p)\n"
        } else {
            while minHeap.first!.l != level[minHeap.first!.p] {
                minHeap.pop()
            }
            result += "\(minHeap.first!.p)\n"
        }
    } else if command == "add" {
        inputProblem()
    } else if command == "solved" {
        level[file.readInt()] = 0
    }
}

print(result)