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


let io = IO()
typealias Box = (R: Int, cnt: Int)
let (N, C) = (io.readInt(), io.readInt())
let M = io.readInt()
let boxes = crtSortedBoxes()
var haveToSend = [Int: Int]()

var amount: Int = C
var result = 0
for i in 1...N {
    let giveBoxCnt = haveToSend[i, default: 0]
    amount += giveBoxCnt
    result += giveBoxCnt
    haveToSend[i] = 0
    for j in 0..<boxes[i].count {
        let cur = boxes[i][j]
        var count = cur.cnt
        if amount < count {
            throwAwayBox(cur.R, &amount, count)
            count = count > amount ? amount : count
        }
        amount -= count
        haveToSend[cur.R, default: 0] += count
    }
}
print(result)


func throwAwayBox(_ j: Int, _ amount: inout Int, _ count: Int) {
    for i in stride(from: N, to: j, by: -1) {
        var upBox = haveToSend[i, default: 0]
        if upBox > 0 {
            if upBox > count-amount { upBox = count-amount }
            haveToSend[i, default: 0] -= upBox
            amount += upBox
        }
    }
}

private func crtSortedBoxes() -> [[Box]] {
    var boxes = [[Box]](repeating: [Box](), count: N+1)
    for _ in 0..<M {
        boxes[io.readInt()].append((io.readInt(), io.readInt()))
    }
    for i in 1...N {
        boxes[i].sort { $0.R < $1.R }
    }
    return boxes
}

