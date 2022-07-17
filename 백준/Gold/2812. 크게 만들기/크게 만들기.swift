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

struct Deque<T> {
    var queue: [T]
    var index = 0

    init() { queue = [T]() }
    init(_ q: T) { queue = [q] }
    init(_ q: [T]) { queue = q }

    var isEmpty: Bool { index >= queue.count }

    var first: T? { isEmpty ? nil : queue[index] }

    var last: T? { queue.last }

    var count: Int { queue.count - index }

    mutating func append(_ x: T) {
        queue.append(x)
    }

    @discardableResult
    mutating func popLast() -> T? {
        queue.popLast()
    }

    @discardableResult
    mutating func popFirst() -> T? {
        defer { index += 1 }
        return queue[index]
    }
}


let io = IO()
let N = io.readInt()
var K = io.readInt()
let strn: [Int] = io.readString().map{$0.wholeNumberValue!}
var deq = Deque<Int>(strn[0])

for i in 1..<N {
    let cur = strn[i]
    while let l = deq.last {
        if l < cur && K > 0 {
            deq.popLast()
            K -= 1
        } else {
            break
        }
    }
    deq.append(cur)
}

var result = ""
for _ in 0..<(deq.count-K) {
    result += "\(deq.popFirst()!)"
}
io.writeByString(result)