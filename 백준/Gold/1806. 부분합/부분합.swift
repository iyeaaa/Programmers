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
let (N, S) = (io.readInt(), io.readInt())
let list = crtList()
var (lf, ryt) = (0, 0)
var sum = list[lf]
var minLen = Int.max

while sum < S && ryt < N-1 {
    ryt += 1
    sum += list[ryt]
}
if sum < S { print(0); exit(0) }

while true {
    while sum >= S {
        sum -= list[lf]
        lf += 1
    }
    lf -= 1
    sum += list[lf]

    minLen = min(minLen, ryt-lf+1)

    if ryt < N-1 {
        ryt += 1
        sum += list[ryt]
    } else { break }
}

print(minLen)

func crtList() -> [Int] {
    var result = [Int]()
    for _ in 0..<N {
        result.append(io.readInt())
    }
    return result
}
