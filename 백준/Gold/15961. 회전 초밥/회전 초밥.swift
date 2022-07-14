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
let (N, d, k, c) = (io.readInt(), io.readInt(), io.readInt(), io.readInt())
var sushis = crtSushis(); sushis += sushis
var ovrLpCnt = [Int](repeating: 0, count: d+1)
var maxCbn = 0
var count = 0
for i in 0..<k {
    let cur = sushis[i]
    if ovrLpCnt[cur] == 0 {
        count += 1
    }
    ovrLpCnt[cur] += 1
}
maxCbn = max(maxCbn, count + (ovrLpCnt[c] > 0 ? 0 : 1))

for i in 0..<N-1 {
    let (lf, ryt) = (sushis[i], sushis[i+k])
    ovrLpCnt[lf] -= 1
    if ovrLpCnt[lf] == 0 { count -= 1 }
    if ovrLpCnt[ryt] == 0 { count += 1 }
    ovrLpCnt[ryt] += 1
    maxCbn = max(maxCbn, count + (ovrLpCnt[c] > 0 ? 0 : 1))
}

print(maxCbn)

func crtSushis() -> [Int] {
    var result = [Int]()
    for _ in 0..<N {
        result.append(io.readInt())
    }
    return result
}