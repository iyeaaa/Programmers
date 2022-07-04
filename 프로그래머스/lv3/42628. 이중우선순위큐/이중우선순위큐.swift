
import Foundation

struct MaxHeap<T: Comparable> {
    private var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    var first: T? { isEmpty ? nil : heap[1] }

    mutating func insert(_ h: T) {
        func haveToUp(_ isrtIdx: Int) -> Bool {
            if isrtIdx <= 1 { return false }
            return heap[isrtIdx] > heap[isrtIdx/2]
        }

        heap.append(h)
        if heap.count == 1 { heap.append(h); return }

        var isrtIdx = heap.count-1
        while haveToUp(isrtIdx) {
            let prntIdx = isrtIdx / 2
            heap.swapAt(isrtIdx, prntIdx)
            isrtIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfIdx = popIdx*2
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

struct MinHeap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    var isEmpty: Bool { heap.count <= 1 }

    var first: T? { isEmpty ? nil : heap[1] }

    mutating func insert(_ h: T) {
        func haveToUp(_ isrtIdx: Int) -> Bool {
            if isrtIdx <= 1 { return false }
            return heap[isrtIdx] < heap[isrtIdx/2]
        }

        heap.append(h)
        if heap.count == 1 { heap.append(h); return }

        var isrtIdx = heap.count-1
        while haveToUp(isrtIdx) {
            let prntIdx = isrtIdx / 2
            heap.swapAt(isrtIdx, prntIdx)
            isrtIdx = prntIdx
        }
    }

    enum Direction { case none, lf, ryt }
    mutating func pop() -> T? {
        func haveToDown(_ popIdx: Int) -> Direction {
            let lfIdx = popIdx*2
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

func solution(_ operations:[String]) -> [Int] {
    var maxHeap = MaxHeap<Int>()
    var minHeap = MinHeap<Int>()
    var popped = [Int: Int]()

    for o in operations {
        let o = o.split{$0==" "}
        if o[0] == "I" {
            let i = Int(o[1])!
            maxHeap.insert(i)
            minHeap.insert(i)
            popped[i, default: 0] += 1
        } else { // o[0] == "D"
            if o[1] == "-1" {
                while let f = minHeap.first {
                    if popped[f]! < 1 {
                        let _ = minHeap.pop()
                    } else {
                        popped[minHeap.pop()!]! -= 1
                        break
                    }
                }
            } else {
                while let f = maxHeap.first {
                    if popped[f]! < 1 {
                        let _ = maxHeap.pop()
                    } else {
                        popped[maxHeap.pop()!]! -= 1
                        break
                    }
                }
            }
        }
    }

    var isEmpty = true
    while let f = minHeap.first {
        if popped[f]! < 1 {
            let _ = minHeap.pop()
        } else {
            isEmpty = false
            break
        }
    }

    while let f = maxHeap.first {
        if popped[f]! < 1 {
            let _ = maxHeap.pop()
        } else {
            break
        }
    }

    return isEmpty ? [0, 0] : [maxHeap.first!, minHeap.first!]
}
