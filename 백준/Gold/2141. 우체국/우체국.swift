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
typealias Village = (X: Int, A: Int)
let N = io.readInt()
let villages: [Village] = crtVillages()
let sumVillages: [Int] = crtSumVillages()

var (lf, ryt) = (0, N-1)
while lf <= ryt {
    let mid = (lf + ryt) / 2
    if haveToLeft(mid) {
        ryt = mid - 1
    } else {
        lf = mid + 1
    }
}
print(villages[lf].X)

func haveToLeft(_ x: Int) -> Bool {
    sumVillages[x] >= sumVillages[N-1]-sumVillages[x]
}

func crtSumVillages() -> [Int] {
    var result = [villages[0].A]
    for i in 1..<N {
        result.append(result[i-1]+villages[i].A)
    }
    return result
}

func crtVillages() -> [Village] {
    var result = [Village]()
    for _ in 0..<N {
        result.append((io.readInt(), io.readInt()))
    }
    return result.sorted { $0.X < $1.X }
}