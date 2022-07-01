import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)
@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}
@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte()
    while !(48...57 ~= byte) { byte = readByte() }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number
}

struct Heap<T: Comparable> {
    var heap = [T]()

    init() { }
    init(_ data: T) {
        heap.append(data)
        heap.append(data)
    }

    mutating func insert(_ data: T) {
        heap.append(data)
        if heap.count == 1 { heap.append(data); return }

        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 { return false }
            let parentIndex = insertIndex / 2
            return heap[insertIndex] > heap[parentIndex]
        }

        var insertIndex = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }

    enum moveDownStatus { case none, left, right }
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }

        let returnData = heap[1]
        heap.swapAt(1, heap.count-1)
        heap.removeLast()

        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = poppedIndex * 2
            let rightChildIndex = leftChildIndex + 1
            if leftChildIndex >= heap.count {
                return .none
            }
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
            }
            if heap[leftChildIndex] <= heap[poppedIndex] && heap[rightChildIndex] <= heap[poppedIndex] {
                return .none
            }
            if heap[leftChildIndex] > heap[poppedIndex] && heap[rightChildIndex] > heap[poppedIndex] {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            return heap[leftChildIndex] > heap[poppedIndex] ? .left : .right
        }

        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = poppedIndex*2 + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
}

var result = ""
var heap = Heap<Int>()

for _ in 0..<readInt() {
    let input = readInt()
    if input == 0 {
        result += "\(heap.pop() ?? 0)\n"
    } else {
        heap.insert(input)
    }
}

print(result)