import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)
@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer[byteIdx]
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { isNegative.toggle(); byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

struct Pair: Comparable { // from comdongsam
    let absolute: Int
    let origin: Int

    init(_ n: Int) {
        absolute = abs(n)
        origin = n
    }

    static func < (lhs: Pair, rhs: Pair) -> Bool {
        if lhs.absolute == rhs.absolute {
            return lhs.origin < rhs.origin
        } else {
            return lhs.absolute < rhs.absolute
        }
    }
}

struct Heap<T: Comparable> {
    var heap = [T]()

    init() {}
    init(_ h: T) { heap.append(h); heap.append(h) }

    mutating func insert(_ h: T) {
        heap.append(h)
        if heap.count == 1 { heap.append(h); return }

        func isMoveUp(_ insertIdx: Int) -> Bool {
            if insertIdx <= 1 { return false }
            return heap[insertIdx] < heap[insertIdx/2]
        }

        var insertIdx = heap.count - 1
        while isMoveUp(insertIdx) {
            let prntIdx = insertIdx / 2
            heap.swapAt(insertIdx, prntIdx)
            insertIdx = prntIdx
        }
    }

    enum moveDownStatus { case none, lf, ryt }
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }

        heap.swapAt(1, heap.count-1)
        let returnData = heap.popLast()!

        func moveDown(_ poppedIdx: Int) -> moveDownStatus {
            let lfChlIdx = poppedIdx * 2
            let rytChlIdx = lfChlIdx + 1
            if lfChlIdx >= heap.count { // 왼쪽 자손 없음
                return .none
            }
            if rytChlIdx >= heap.count { // 왼쪽 자손 있지만 오른쪽 자손 없음
                return heap[lfChlIdx] < heap[poppedIdx] ? .lf : .none
            }
            if heap[lfChlIdx] >= heap[poppedIdx] && heap[rytChlIdx] >= heap[poppedIdx] {
                return .none // 왼.오 모두 있으나 자손이 더 큼 -> 바꿀필요 없음
            }
            if heap[lfChlIdx] < heap[poppedIdx] && heap[rytChlIdx] < heap[poppedIdx] {
                return heap[lfChlIdx] < heap[rytChlIdx] ? .lf : .ryt
                // 왼.오 모두 가능하기에 더 작은것 선택
            }
            // 왼.오 중 하나가 가능함 -> 가능한것 찾아서 리턴
            return heap[lfChlIdx] < heap[poppedIdx] ? .lf : .ryt
        }

        var poppedIdx = 1
        while true {
            switch moveDown(poppedIdx) {
            case .none:
                return returnData
            case .lf:
                let lfChlIdx = poppedIdx*2
                heap.swapAt(poppedIdx, lfChlIdx)
                poppedIdx = lfChlIdx
            case .ryt:
                let rytChlIdx = poppedIdx*2 + 1
                heap.swapAt(poppedIdx, rytChlIdx)
                poppedIdx = rytChlIdx
            }
        }
    }
}


var heap = Heap<Pair>()
var result = ""
for _ in 0..<readInt() {
    let input = readInt()
    if input == 0 {
        result += "\(heap.pop()?.origin ?? 0)\n"
    } else {
        heap.insert(Pair(input))
    }
}

print(result)